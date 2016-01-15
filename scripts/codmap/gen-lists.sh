#!/bin/bash

# teams and planners

mv -f team-planners.list team-planners.list~ 2> /dev/null
rm -f team-planners.list

for t in team*/
do
    cd $t
    for p in planner*/
    do
        echo "${t%/} ${p%/}" >> ../team-planners.list
    done
    cd ..
done

# domains, problems and agents

mv -f domain-problem-agents.list domain-problem-agents.list~ 2> /dev/null
rm -f domain-problem-agents.list

for d in benchmarks/factored/*/
do
    for p in $d*/
    do
        acount=0
        for a in $p/problem-*.pddl; do let "acount+=1"; done;

        echo "$(basename $d) $(basename $p) $acount" >> domain-problem-agents.list
    done
done
