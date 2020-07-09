#!/bin/bash

if [ $# -ne 3 ];then
	echo "你给的参数个数不对，应该给三个参数"
	exit
fi

if_number() {
	n1=`echo $1 | sed 's/[0-9.]//g'`
	if [ -n "$n1" ];then
		echo "$1不是纯数字"
		continue
	fi

	if echo $1 | grep -q '^\.';then
		echo "数字是以点开头的"
		exit
	fi
}

if_number $1
if_number $3


case $2 in
	+)
		echo "$1+$3" | bc
		;;
	-)
		echo "$1-$3" | bc
		;;
	\*)
		echo "$1*$3" | bc
		;;
	/)
		echo "scale=2;$1/$3" | bc
		;;
	*)
		echo "你给出的格式不对，第二个参数只能是+ - * /"
		;;
esac
