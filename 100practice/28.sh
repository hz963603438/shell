#!/bin/bash

sum=0
for i in `seq 1 100`
do
	j=$((i%3))
	if [ $j -eq 0 ];then
		sum=$(($sum+$i))
	fi
done
echo $sum
