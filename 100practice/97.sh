#!/bin/bash

while :
do
	read -p "please input the lenth: " n
	if [ -z $n ];then
		echo "请输入一个数字"
		continue
	else
		n1=`echo $n | sed 's/[0-9]//g'`
		if [ -n "$n1" ];then
			echo "请输入一个纯数字"
			continue
		else
			break
		fi
	fi
done

for i in `seq 1 $n`
do
	j=$(($n-$i))
	for m in `seq $j`
	do
		echo -n " "
	done
	
	for p in `seq 1 $i`
	do
		echo -n "* "
	done
	echo
done
