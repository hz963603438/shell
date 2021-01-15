#!/bin/bash

sum=0

for num in `ps aux | grep -v 'TIME COMMAND' | awk '{print $6}'`
#echo $sum
#echo $num
do 
	sum=$(( $sum+$num ))
done
echo $sum
