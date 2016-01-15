#!/bin/bash

# This script runs a specified planner (or configuration of a planner) on all (or one selected)
# problem(s) in benchmarks/ dir. It limits and measures used the memory and run time of the planner.
# If the planner successfully finishes, it runs VAL on the returned plan and writes the results to
# standard output.
#
# parameters:   run.sh <planner> [<domain-name> [<problem-name>]]
# example:    ./run.sh planner1   logistics00    probLOGISTICS-5-0
#
# <planner>: a directory with one planner or one configuration of a planner; the planner will be run
#     using the <planner>/plan.sh script (look into planner1/plan.sh for more information about how
#     the planner will be run and parameterized)
#
# <domain-name>: if the <domain-name> is specified the <planner> is run on all problems of that
#     particular domain
#
# <problem-name>: if the <domain-name> is specified together with the <problem-name> the <planner> is
#     run only on that particular domain and problem

TIMEOUT=30m
WARMUPTIME=3s
MYIP=`hostname -I | awk '{print $1}'`
OUT=""

function generate-agent-ip-list {
    echo "run.sh: generating agent-ip list for domain $1 and problem $2 ..."

    rm -f agent.list
    rm -f agent-ip.list

    if [[ ! -d "benchmarks/factored/$1/$2/" ]]; then
        echo "run.sh: benchmarks/factored/$1/$2/ does not exist!"
        exit 1
    fi

    for p in benchmarks/factored/$1/$2/problem-*.pddl
    do
        regex='problem-(.+)\.pddl'
        if [[ ! $p =~ $regex ]]
        then
            echo "Agent name not found in $p problem!";
            exit 1;
        fi
        echo "${BASH_REMATCH[1]}" >> agent.list
    done

    paste agent.list ip.list > agent-ip.list
    sed '/^\s/d' agent-ip.list > tmp.list
    mv tmp.list agent-ip.list
}

function plan {
    while read line; do
        agent=`echo "$line" | awk '{print $1}'`
        ip=`echo "$line" | awk '{print $2}'`

        echo "run.sh: running $1 on domain $2 and problem $3 as agent $agent on machine $ip ..."

        domainfile="../benchmarks/factored/$2/$3/domain-$agent.pddl"
        problemfile="../benchmarks/factored/$2/$3/problem-$agent.pddl"

        ssh $ip "
          cd $1;
          sleep $WARMUPTIME;
          /usr/bin/time -o ../stats.out -f \"%E %M %x\" timeout -s SIGTERM $TIMEOUT ./plan.sh $domainfile $problemfile $agent ../agent-ip.list ../plan.out || echo 'failed';" &
    done < agent-ip.list

    jobs=`jobs -p`
    echo "run.sh: jobs of remote planners:" $(echo $jobs)

    fail=0
    for job in $jobs
    do
        echo "run.sh: waiting for job: $job"
        wait $job || let "fail+=1"
    done

    if [[ $fail -ne 0 ]]
    then
        echo "run.sh: ssh process failed!"
        exit 1
    fi

    stats=''
    plans=''
    echo "run.sh: gather stats and plans..."
    while read line; do
        agent=`echo "$line" | awk '{print $1}'`
        ip=`echo "$line" | awk '{print $2}'`

        scp $ip:~/plan.out .
        mv plan.out plan-$ip.out
        plans="$plans plan-$ip.out"

        scp $ip:~/stats.out .
        stats="$stats $agent($ip): $(<stats.out)\n"
        rm -f stats.out
    done < agent-ip.list

    echo "run.sh: linearizing ..."
    ./LIN/linearize plan.out $plans
    statsLIN=$?
    #rm -f $plans

    echo "run.sh: converting ma-pddl to pddl for validation ..."
    mkdir -p ./temp
    ./ma-to-pddl.py benchmarks/unfactored/$2/$3 domain problem ./temp

    echo "run.sh: validating ..."
    ./VAL/validate -v ./temp/domain.pddl ./temp/problem.pddl plan.out > val.out

    #cat val.out

    if [[ $(cat val.out | grep "Plan valid") == *valid* ]]; then
      echo "The plan is valid!"
      STATSVAL=0
      COST=`cat val.out | grep "Final value: " | sed 's/Final value: //'`
      MAKESPAN=`cat val.out | grep "Checking next happening" | tail -1 | sed 's/Checking next happening (time \([0-9]*\))/\1/'`
      echo "  Plan cost: $COST"
      echo "  Plan makespan: $MAKESPAN"
    else
      echo "The plan is not valid!"
      STATSVAL=-1
      COST=-1
      MAKESPAN=-1
    fi

    rm -rf ./temp
    rm -f plan.out
    rm -f val.out

    OUT="$OUT$1 $2 $3:\n $stats $STATSVAL $COST $MAKESPAN\n"
}

function plan-in-context {
    generate-agent-ip-list $2 $3

    echo "run.sh: copying to peers..."
    for ip in `awk '{print $2}' agent-ip.list`; do
        if [[ "$ip" == "" ]]
        then
            echo "run.sh: agent without an IP address in agent-ip.list!"
            exit 1
        fi

        if [[ "$ip" == "$MYIP" ]]
        then
            echo "run.sh: -> $ip (skipping myself)..."
        else
            echo "run.sh: -> $ip..."
            rsync -rl . $ip:~/
        fi
    done

    plan $1 $2 $3

    echo "run.sh: cleaning up..."
    rm -f agent.list
    rm -f agent-ip.list
}

if [ "$#" -eq 3 ]; then
    plan-in-context $1 $2 $3

    echo "run.sh: results ({agent(IP): elapsed time, maximal memory, planner exit code}+, VAL exit code, plan cost, plan makespan):"
    echo -e $OUT

    exit 0
fi

if [ "$#" -eq 2 ]; then
    for problem in benchmarks/factored/$2/*/
    do
        problem=`basename $problem`
        plan-in-context $1 $2 $problem
    done

    echo "run.sh: results ({agent(IP): elapsed time, maximal memory, planner exit code}+, VAL exit code, plan cost, plan makespan):"
    echo -e $OUT

    exit 0
fi


if [ "$#" -eq 1 ]; then
    for domain in benchmarks/factored/*/
    do
        domain=`basename $domain`
        for problem in benchmarks/factored/$domain/*/
        do
            problem=`basename $problem`
            plan-in-context $1 $domain $problem
        done
    done

    echo "run.sh: results (elapsed time, maximal memory, planner exit code, VAL exit code, plan cost, plan makespan):"
    echo -e $OUT

    exit 0
fi

echo "run.sh: illegal number of parameters!"
exit 1
