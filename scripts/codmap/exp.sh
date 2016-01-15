#!/bin/bash

# parameters:   exp.sh [c]
#
# c: centralized -- overrides the number of agents to 1 effectively running the planner on one machine,
#                   i.e. in centralized manner
#


TIMEOUT=30m
WARMUPTIME=3s
MYIP=`hostname -I | awk '{print $1}'`
RESULTS="/home/results"
OUT=""


#################################
##                             ##
##         DISTRIBUTED         ##
##                             ##
#################################

function plan-in-context {
    read -a allocips <<< "$@"
    allocips=${allocips[@]:5}

    generate-agent-ip-list $3 $4

    echo "exp.sh: copying to peers..."
    for ip in `awk '{print $2}' agent-ip.list`; do
        if [[ "$ip" == "" ]]
        then
            echo "exp.sh: agent without an IP address in agent-ip.list!"
            return # exit 1
        fi

        if [[ "$ip" == "$MYIP" ]]
        then
            echo "exp.sh: -> $ip (skipping myself)..."
        else
            echo "exp.sh: -> $ip..."
            rsync -e 'ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no' -rl . $ip:/home/$1
        fi
    done

    # prepare the result and logs dir
    resultdir=$RESULTS/$1-$2-$3-$4-$5/
    mkdir -p $resultdir
    cp ip.list $resultdir/ip.list
    cp agent.list $resultdir/agent.list
    cp agent-ip.list $resultdir/agent-ip.list

    # cleaning can/has to be done here as the ip files are already cp-ed/rsynced to the resultdir/peers
    echo "exp.sh: cleaning up..."
    rm -f agent.list
    rm -f agent-ip.list

    # locking has to be out of the parallel call
    echo "exp.sh: locking..."
    for ip in $allocips; do
        touch ../lock$ip
        echo "lock$ip"
    done

    plan $1 $2 $3 $4 $resultdir $allocips &
}

function generate-agent-ip-list {
    echo "exp.sh: generating agent-ip list for domain $1 and problem $2 ..."

    rm -f agent.list
    rm -f agent-ip.list

    for p in /home/benchmarks/factored/$1/$2/problem-*.pddl
    do
        regex='problem-(.+)\.pddl'
        if [[ ! $p =~ $regex ]]
        then
            echo "Agent name not found in $p problem!";
            return # exit 1;
        fi
        echo "${BASH_REMATCH[1]}" >> agent.list
    done

    paste agent.list ip.list > agent-ip.list
    sed '/^\s/d' agent-ip.list > tmp.list
    mv tmp.list agent-ip.list
}

function plan {
    team="$1"
    planner="$2"
    domain="$3"
    problem="$4"
    resultdir="$5"
    read -a allocips <<< "$@"
    allocips=${allocips[@]:5}

    # run the planner processes on the peers and wait for timeouts or finish
    while read line; do
        agent=`echo "$line" | awk '{print $1}'`
        ip=`echo "$line" | awk '{print $2}'`

        echo "exp.sh $team: running planner $planner on domain $domain and problem $problem as agent $agent on machine $ip ..."

        domainfile="../benchmarks/factored/$domain/$problem/domain-$agent.pddl"
        problemfile="../benchmarks/factored/$domain/$problem/problem-$agent.pddl"

        ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $ip "
          export HOME=/home/$team;
          cd /home/$team/$planner;
          rm -f ../stats.out ../plan.out ../std.out ../err.out
          rm -rf /home/$team/benchmarks
          ln -s ../benchmarks/ /home/$team/benchmarks
          sleep $WARMUPTIME;
          /usr/bin/time -o ../stats.out -f \"%E %M %x\" timeout -s SIGKILL $TIMEOUT ./plan.sh $domainfile $problemfile $agent ../agent-ip.list ../plan.out > ../std.out 2> ../err.out || echo 'failed';" &
    done < $resultdir/agent-ip.list

    jobs=`jobs -p`
    echo "exp.sh $team: jobs of remote planners:" $(echo $jobs)

    fail=0
    for job in $jobs
    do
        echo "exp.sh $team: waiting for job: $job"
        wait $job || let "fail+=1"
    done

    STATSSSH=0
    if [[ $fail -ne 0 ]]
    then
        echo "exp.sh $team: ssh process failed!"

        echo "exp.sh $team: emergency unlocking..."
        for ip in $allocips; do
            rm ../lock$ip
            echo "lock$ip"
        done

        let "STATSSSH-=$fail"

        return # exit 1
    fi

    # download, backup and clear
    STATS=''
    plans=''
    echo "exp.sh $team: gather logs, stats and plans..."
    while read line; do
        agent=`echo "$line" | awk '{print $1}'`
        ip=`echo "$line" | awk '{print $2}'`

        # download logs, stats and plans
        scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $ip:/home/$team/std.out $resultdir/std-$ip.out
        scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $ip:/home/$team/err.out $resultdir/err-$ip.out
        scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $ip:/home/$team/plan.out $resultdir/plan-$ip.out
        scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $ip:/home/$team/stats.out $resultdir/stats-$ip.out
        plans="$plans $resultdir/plan-$ip.out"
        STATS="$STATS $agent($ip): $(<$resultdir/stats-$ip.out) "

        # backup the working dir
        mkdir -p $resultdir/$ip/$planner
        rsync -e 'ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no' --exclude '*.jar' $ip:/home/$team/* $resultdir/$ip/
        rsync -e 'ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no' --exclude '*.jar' $ip:/home/$team/$planner/* $resultdir/$ip/$planner

        # clean any created data
        rsync -e 'ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no' -rl --delete /home/$team $ip:/home
    done < $resultdir/agent-ip.list

    # linearize and validate
    echo "exp.sh $team: linearizing ..."
    ./LIN/linearize $resultdir/plan.out $plans
    STATSLIN=$?

    if [[ "$domain" = "taxi" || "$domain" = "wireless" ]]; then
        echo "exp.sh $team: hack for taxi & wireless ..."
        sed "s/_/ /g" $resultdir/plan.out > $resultdir/plan-fix.out
        mv -f $resultdir/plan-fix.out $resultdir/plan.out
    fi

    echo "exp.sh $team: converting ma-pddl to pddl for validation ..."
    ./ma-to-pddl.py /home/benchmarks/unfactored/$domain/$problem domain problem $resultdir

    echo "exp.sh $team: validating ..."
    ./VAL/validate -v $resultdir/domain.pddl $resultdir/problem.pddl $resultdir/plan.out > $resultdir/val.out

    if [[ $(cat $resultdir/val.out | grep "Plan valid") == *valid* ]]; then
      echo "The plan is valid!"
      STATSVAL=0
      COST=`cat $resultdir/val.out | grep "Final value: " | sed 's/Final value: //'`
      MAKESPAN=`cat $resultdir/val.out | grep "Checking next happening" | tail -1 | sed 's/Checking next happening (time \([0-9]*\))/\1/'`
      echo "  Plan cost: $COST"
      echo "  Plan makespan: $MAKESPAN"
    else
      echo "The plan is not valid!"
      STATSVAL=-1
      COST=-1
      MAKESPAN=-1
    fi

    # write results
    ac=`wc $resultdir/agent-ip.list | awk '{print $1}'`
    echo "$team $planner $domain $problem $ac" >> ../task-done.list
    echo "$team $planner $domain $problem $ac $STATSSSH $STATSLIN $STATSVAL $COST $MAKESPAN $STATS" >> ../results.list

    # unlocking has to be in the parallel call
    echo "exp.sh $team: unlocking..."
    for ip in $allocips; do
        rm ../lock$ip
        echo "lock$ip"
    done
}


#################################
##                             ##
##         CENTRALIZED         ##
##                             ##
#################################

function plan-in-context-central {
    # prepare the result and logs dir
    resultdir=$RESULTS/$1-$2-$3-$4-$5/
    mkdir -p $resultdir

    # locking has to be out of the parallel call
    echo "exp.sh: locking..."
    touch ../lock$6
    echo "lock$6"

    plan-central $1 $2 $3 $4 $resultdir $6 &
}

function plan-central {
    team="$1"
    planner="$2"
    domain="$3"
    problem="$4"
    resultdir="$5"
    ip="$6"

    # run the planner process on remote machine and wait for timeout or finish
    echo "exp.sh $team: running centralized planner $planner on domain $domain and problem $problem on machine $ip ..."

    STATSSSH=0
    ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $ip "
      export HOME=/home/$team;
      cd /home/$team/$planner;

      rm -rf /home/$team/benchmarks
      ln -s ../benchmarks/ /home/$team/benchmarks

      rm -f ../stats.out ../plan.out ../std.out ../err.out
      sleep $WARMUPTIME;
      /usr/bin/time -o ../stats.out -f \"%E %M %x\" timeout -s SIGKILL $TIMEOUT ./plan.sh $domain $problem > /dev/null 2> ../err.out || echo 'failed';" || (
        echo "exp.sh $team: ssh process failed!"

        echo "exp.sh $team: emergency unlocking..."
        rm ../lock$ip
        echo "lock$ip"

	STATSSSH=-1
        return # exit 1
    )

    # download logs, stats and plans
    #scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $ip:/home/$team/std.out $resultdir/std.out
    scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $ip:/home/$team/err.out $resultdir/err.out
    scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $ip:/home/$team/plan.out $resultdir/plan.out
    scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $ip:/home/$team/stats.out $resultdir/stats.out
    STATS=$(<$resultdir/stats.out)

    # backup the working dir
    mkdir -p $resultdir/$ip/$planner/
    rsync -e 'ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no' --exclude '*.jar' $ip:/home/$team/* $resultdir/$ip/
    rsync -e 'ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no' --exclude '*.jar' $ip:/home/$team/$planner/* $resultdir/$ip/$planner/

    # clean any created data
    rsync -e 'ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no' -rl --delete /home/$team $ip:/home

    # validate
    if [[ "$domain" = "taxi" || "$domain" = "wireless" ]]; then
        echo "exp.sh $team: hack for taxi & wireless ..."
        sed "s/_/ /g" $resultdir/plan.out > $resultdir/plan-fix.out
        mv -f $resultdir/plan-fix.out $resultdir/plan.out
    fi

    echo "exp.sh $team: converting ma-pddl to pddl for validation ..."
    ./ma-to-pddl.py /home/benchmarks/unfactored/$domain/$problem domain problem $resultdir

    echo "exp.sh $team: validating ..."
    ./VAL/validate -v $resultdir/domain.pddl $resultdir/problem.pddl $resultdir/plan.out > $resultdir/val.out

    if [[ $(cat $resultdir/val.out | grep "Plan valid") == *valid* ]]; then
      echo "The plan is valid!"
      STATSVAL=0
      COST=`cat $resultdir/val.out | grep "Final value: " | sed 's/Final value: //'`
      MAKESPAN=`cat $resultdir/val.out | grep "Checking next happening" | tail -1 | sed 's/Checking next happening (time \([0-9]*\))/\1/'`
      echo "  Plan cost: $COST"
      echo "  Plan makespan: $MAKESPAN"
    else
      echo "The plan is not valid!"
      STATSVAL=-1
      COST=-1
      MAKESPAN=-1
    fi

    # write results
    echo "$team $planner $domain $problem 1" >> ../task-done.list
    echo "$team $planner $domain $problem 1 $STATSSSH $STATSVAL $COST $MAKESPAN $STATS" >> ../results.list

    # unlocking has to be in the parallel call
    echo "exp.sh $team: unlocking..."
    rm ../lock$ip
    echo "lock$ip"
}


#################################
##                             ##
##            MAIN             ##
##                             ##
#################################

central=false
[[ "$1" == "c" ]] && central=true

mv -f $RESULTS $RESULTS~ 2> /dev/null
rm -rf $RESULTS
mv -f task-done.list task-done.list~ 2> /dev/null
rm -f task-done.list
mv -f results.list results.list~ 2> /dev/null
rm -f results.list

readarray t < task.list
taskcount=${#t[@]}
echo "exp.sh: count of tasks: " $taskcount

while [[ "$taskcount" -gt 0 ]]; do
    ti=0
    for task in "${t[@]}"; do
        if [[ ! -z ${task// } ]]; then
            echo "exp.sh: task $task is not done yet"

            availips=(); while read ip; do [[ ! -e lock$ip ]] && availips+=($ip); done < all-ip.list

            team=`echo "$task" | awk '{print $1}'`
            planner=`echo "$task" | awk '{print $2}'`
            domain=`echo "$task" | awk '{print $3}'`
            problem=`echo "$task" | awk '{print $4}'`
            agentcount=`echo "$task" | awk '{print $5}'`
            [[ $central == true ]] && agentcount=1

            echo "exp.sh: task needs $agentcount agents; currently available IPs are:" ${availips[@]}
            if [[ $agentcount -le ${#availips[@]} ]]; then
                # allocate task
                t[$ti]=''
                allocips=()
                allocips=${availips[@]:0:$agentcount}
                taskcount=$((taskcount-1))

                echo "exp.sh: new count of tasks: $taskcount; allocating to IPs:" $allocips

                # run planning
                cd $team
                if [[ $central == true ]]; then
                    plan-in-context-central $team $planner $domain $problem $agentcount ${allocips[@]}
                else
                    printf "%s\n" ${allocips[@]} > ip.list
                    plan-in-context $team $planner $domain $problem $agentcount ${allocips[@]}
                    rm -f ip.list
                fi
                cd ..
            fi
        fi
        ti=$((ti+1))
    done

    sleep 10s
done

exit 0
