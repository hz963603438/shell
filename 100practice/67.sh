#!/bin/bash

while :
do
	cpu_i=`top -bn1 | grep 'Cpu(s):' | sed 's/^%//g' | awk -F ' +|%' '{print $8}'`
	cpu_u=`echo 100-$cpu_i | bc`
	
	if [ $cpu_u -lt 10 ];then
		python mail.py 123@163.com "cpu使用率偏高" "`top -bn1`"
	fi
	sleep 10
done
