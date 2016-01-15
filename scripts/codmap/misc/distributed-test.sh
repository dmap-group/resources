#!/bin/bash

echo "apn1	147.32.80.194
tru1	147.32.80.195
tru2	147.32.80.196" > agent-ip.list

cd planner1

./plan.sh ../benchmarks/factored/logistics00/probLOGISTICS-5-0/domain-tru1.pddl ../benchmarks/factored/logistics00/probLOGISTICS-5-0/problem-tru1.pddl tru1 ../agent-ip.list ../plan-147.32.80.195.out

./plan.sh ../benchmarks/factored/logistics00/probLOGISTICS-5-0/domain-tru2.pddl ../benchmarks/factored/logistics00/probLOGISTICS-5-0/problem-tru2.pddl tru2 ../agent-ip.list ../plan-147.32.80.196.out

./plan.sh ../benchmarks/factored/logistics00/probLOGISTICS-5-0/domain-apn1.pddl ../benchmarks/factored/logistics00/probLOGISTICS-5-0/problem-apn1.pddl apn1 ../agent-ip.list ../plan-147.32.80.194.out

cd ..

rm plan.out
./LIN/linearize plan.out plan-147.32.80.195.out plan-147.32.80.196.out plan-147.32.80.194.out

echo "run.sh: converting ma-pddl to pddl for validation ..."
mkdir -p ./temp
./ma-to-pddl.py benchmarks/unfactored/logistics00/probLOGISTICS-5-0 domain problem ./temp

echo "run.sh: validating ..."
./VAL/validate -v ./temp/domain.pddl ./temp/problem.pddl plan.out

rm -r ./temp
rm ./plan-*
rm ./plan.out
rm agent-ip.list


