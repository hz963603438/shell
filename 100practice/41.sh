#!/bin/bash

d=`date -d "-10 hours" +%H`

if [ $d -ge 0 -a $d -lt 7 ];then
	tag=1
elif [ $d -ge 7 -a $d -lt 12 ];then
	tag=2
elif [ $d -ge 12 -a $d -lt 18 ];then
	tag=3
else
	tag=4
fi

case $tag in
	1)
		echo "早上好"
		;;
	2)
		echo "上午好"
		;;
	3)
		echo "下午好"
		;;
	4)
		echo "晚上好"
		;;
esac
