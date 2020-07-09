#!/bin/bash

while :
do
	read -p "please input a number: " n
	if [ -z "$n" ];then
		echo "请输入一个数字"
		continue
	fi
	if echo $n | grep -qi 'end';then
		exit
	fi
	n1=`echo $n | sed 's/[0-9]//g'`
	if [ -n "$n1" ];then
		echo "请输入一个纯数字"
		continue
	else
		echo "你输入的数字是: $n"
		continue
	fi
done
