#!/bin/bash

sum=0
for i in {1..100};do
	yushu=$[$i%3]
	if [ $yushu -eq 0 ];then
		echo $i
		sum=$[$sum+$i]
	fi
done 

echo $sum
