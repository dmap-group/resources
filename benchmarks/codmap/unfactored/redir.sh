#!/bin/bash

for d in */
do
    echo $d
    cd $d

    mv domain.pddl ../domain.pddl

    for f in *.pddl
    do
        nd="${f%.*}"
        mkdir $nd
        mv $f $nd/problem.pddl
        cp ../domain.pddl $nd/domain.pddl
    done

    rm -r ../domain.pddl

    cd ..
done
