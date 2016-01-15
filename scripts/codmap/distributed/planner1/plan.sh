#!/bin/bash

# This script acts as an unified running interface of your planner process (all planners will have
# similar script). During the competition this script will be used by our infrastructure to run your
# planner. In this testing environment, the run.sh script in your team's home dir calls this plan.sh
# scripts distributively to demonstrate running of your planner.
#
# parameters:   plan.sh <domain-file> <problem-file> <agent-name> <agent-ip-file> <output-file>
# example:    ./plan.sh ../benchmarks/factored/driverlog/pfile1/domain-driver1.pddl \
#                       ../benchmarks/factored/driverlog/pfile1/problem-driver1.pddl \
#                        driver1 ../agent-ip.list ../plan.out
#
# <domain-file>: file name of the domain the planner should be run for
#
# <problem-file>: file name of the problem in the domain <domain-file> the planner should plan with
#
# <agent-name>: name of the agent this planning process plans for
#
# <agent-ip-file>: file name of the list of agents and their IP adresses
#
# <output-file>: file the planner should write the resuting plan in
#
# Note: If your planner needs to run some other service(s) before, this is the right place to do it
# (e.g., message brokers, etc.). The running time is computed including this script. If you need to
# run the additional service only once for one planning problem, you has to check if this is the IP
# address of the primary process. The distributed planners are allowed to use only the factored
# benchmarks in ../benchmarks/factored (the unfactored version is only for use by ma-to-pddl.py).
# See more information in the CoDMAP rules at http://agents.fel.cvut.cz/codmap/.


# *************** REPLACE BY CODE RUNNING YOUR PLANNER ***************
./mockup-dist-planner $1 $2 $3 $4 $5
