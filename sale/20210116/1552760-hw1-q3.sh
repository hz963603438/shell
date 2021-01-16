#!/bin/bash

in_file=${1}
cat ${in_file} | wc -l > ./1552760-hw1-q3.log
cat ${in_file} | wc -m >> ./1552760-hw1-q3.log
end_time=$(tail -n1 ${in_file} | awk '{print $1}')
start_time=$(head -n1 ${in_file} | awk '{print $1}')
echo "$(((($(date +%s -d ${end_time})-$(date +%s -d ${start_time}))+(60*60*24))%(60*60*24)))s" >> ./1552760-hw1-q3.log
text=$(awk '{print $NF}' ${in_file} | grep -Fxv '0.00')
s=0
for line in ${text}
do
    s=$(echo "${s} ${line}" | awk '{printf ("%.2f\n",$1+$2)}')
done
echo "${s} $(echo "${text}" | wc -l)" | awk '{printf ("%.3f\n",$1/$2)}' >> ./1552760-hw1-q3.log
