#!/bin/bash

n=`echo $1| wc -L`
for d in `echo $1 | sed 's/./& /g'`
do
	n2=$(($n%3))
	if [ $n2 -eq 0 ];then
		echo -n ",$d"
	else
		echo -n "$d" 
	fi
	n=$(($n-1))
done | sed 's/^,//'
echo
echo  #echo表示一个回车
