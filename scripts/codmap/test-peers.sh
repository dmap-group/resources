#!/bin/bash

while read ip; do

    echo $ip;
    (ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $ip "
        echo $ip pass;
        grep MemFree /proc/meminfo;
        grep MemAvailable /proc/meminfo;
        pstree;
    " < /dev/null || echo "$ip failed")

    scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no /home/team10/planner1/plan.sh $ip:/home/team10/planner1/plan.sh
    scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no /home/team10/planner2/plan.sh $ip:/home/team10/planner2/plan.sh


done < test-ip.list
