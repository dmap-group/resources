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
OUT=""

function plan {
    echo "run.sh: running $1 on domain $2 and problem $3 ..."

    cd $1
    /usr/bin/time -o stats.out -f "%E %M %x" timeout -s SIGTERM $TIMEOUT ./plan.sh $2 $3
    STATS=$(<stats.out)
    rm -f stats.out
    cd ..

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

    OUT="$OUT$1 $2 $3: $STATS $STATSVAL $COST $MAKESPAN\n"
}

if [ "$#" -eq 3 ]; then
    plan $1 $2 $3

    echo "run sh: results (elapsed time, maximal memory, planner exit code, VAL exit code, plan cost, plan makespan):"
    echo -e $OUT

    exit 0
fi

if [ "$#" -eq 2 ]; then
    for problem in benchmarks/factored/$2/*/
    do
        problem=`basename $problem`
        plan $1 $2 $problem
    done

    echo "run sh: results (elapsed time, maximal memory, planner exit code, VAL exit code, plan cost, plan makespan):"
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
            plan $1 $domain $problem
        done
    done

    echo "run sh: results (elapsed time, maximal memory, planner exit code, VAL exit code, plan cost, plan makespan):"
    echo -e $OUT

    exit 0
fi

echo "run.sh: illegal number of parameters!"
exit 1
