#!/bin/bash

n=1
cat $1 | while read line
do
	n2=$((n%3))
	if [ $n2 -eq 0 ];then
		echo "$line"
	else
		echo -n "$line "
	fi		
	n=$((n+1))
done
echo
