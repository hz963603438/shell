#!/bin/bash
#判断两个数的大小

if [ $# -ne 2 ];then
	echo "请输入两个参数"
	exit
fi

if_number() {
	if echo $1 | grep -q '^-';then
		nu=`echo $1 | sed 's/^-//g'`
	else
		nu=$1
	fi
	n=`echo $nu | sed 's/[0-9.]//g'`
	if [ -n "$n" ];then
		echo "$1不是合法数字"
		exit
	fi
	if echo $1 | grep -q '^\.';then
		echo "$1不是合法数字"
		exit
	fi
}

if_number $1
if_number $2

n1=`echo "$1>$2" | bc`
if [ $n1 -eq 1 ];then
	echo "$1 > $2"
else
	#n2=`echo "$1-($2)" | bc`
	#if [ $n2 == "0" ];then
	if [ "$1" == "$2" ];then
		echo "$1 = $2"
	else
		echo "$1 < $2"
	fi
fi
