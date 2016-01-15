#!/bin/bash

while read ip; do
    rm -f lock$ip
done < all-ip.list
