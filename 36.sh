#!/bin/bash

while read line
do
	num=`echo $line | sed 's/[^0-9]//g' | wc -L`
	if [ $num -eq 1 ];then
		echo $line
	fi
done < $1
