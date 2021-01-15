#!/bin/bash

count_ip=`grep "03/May/2019:1[0-2]:[0-5][0-9]" access-2019-05-03.log | awk '{print $1}' | sort | uniq -c | sort -rn | head` | awk 'NR==1 {print}'

echo $count_ip

