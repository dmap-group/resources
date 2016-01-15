#!/bin/bash

mv -f task.list task.list~ 2> /dev/null
rm -f task.list

while read a; do while read b; do echo "$a $b" >> task.list; done < domain-problem-agents.list; done < team-planners.list

sort --random-sort task.list > tmp.list
mv -f tmp.list task.list
