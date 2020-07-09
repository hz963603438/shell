#!/bin/bash

echo $$
pp=$$
ps -elf | sed '1'd > /tmp/pid.txt
for pid in `awk -v ppn=$pp '$5!=ppn {print $4}' /tmp/pid.txt`
do
	if ! [ -d /proc/$pid ];then
		echo "系统中没有pid为$pid的目录，需要检查"
	fi
done
