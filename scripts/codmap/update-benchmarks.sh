#!/bin/bash

while read ip; do

    rsync -e 'ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no' -av --delete benchmarks $ip:/home

done < all-ip.list
