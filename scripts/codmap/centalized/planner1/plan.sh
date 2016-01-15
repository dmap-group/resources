#!/bin/bash

# This script acts as an unified running interface of your planner (all planners will have similar
# script). During the competition this script will be used by our infrastructure to run your
# planner. In this testing environment, the run.sh script in your team's home dir calls this plan.sh
# to demonstrate running of your planner.
#
# parameters:   plan.sh <domain-name> <problem-name>
# example:    ./plan.sh logistics00   probLOGISTICS-5-0
#
# <domain-name>: name of the domain the planner should be run for; one of the dirs in team's home
#     benchmarks/factored/ or benchmarks/unfactored (your planner can use the factored, unfactored
#     or both input files)
#
# <problem-name>: name of the problem in the domain <domain-name> the planner should solve; one of
#     the dirs in team's home benchmarks/factored/<domain-name>/ or
#     benchmarks/unfactored/<domain-name>/ (your planner can use the factored, unfactored or both
#     input files)
#
# <output-file>: file the planner should write the resuting plan in
#
# Note: If your planner needs to run some other service(s) before, this is the right place to do it
# (e.g., message brokers, etc.). The running time is computed including this script.




# *************** REPLACE BY CODE RUNNING YOUR PLANNER ***************
./mockup-planner ../benchmarks/unfactored/$1/$2/domain.pddl ../benchmarks/unfactored/$1/$2/problem.pddl ../plan.out
