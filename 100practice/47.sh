#!/bin/bash

get_number() {
for i in `seq 0 2`
do
	a[$i]=$(($RANDOM%10))
	echo ${a[$i]}
done

echo ${a[@]} | sed 's/ //g'
}

if [ $# -eq 0 ];then
	get_number
elif [ $# -eq 1 ];then
	n=`echo $1 | sed 's/[0-9]//g'`
	if [ -n "$n" ];then
		echo "给定的参数必须是一个数字"
		exit 1
	fi
	for i in `seq 1 $1`
	do
		get_number
	done | xargs
else
	echo "正确的格式是sh $0 数字"
fi
