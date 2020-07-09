#!/bin/bash

while read line
do
	length=`echo $line | wc -L`
	#echo $length
	if [ $length -lt 10 ];then
		over_num=`echo $line | awk -F: '{print $1}'`
		echo $over_num
	fi
done < $1
