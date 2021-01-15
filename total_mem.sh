#!/bin/bash

mem=$(ps aux| awk '{print $6}' | grep -v RSS)
#echo $mem
sum=0
for i in $mem
	do
		sum=$[$i+$sum]
		echo  $i $sum
	done
echo $sum 
msum=$[$sum/1024]
echo ${msum}M
