#!/bin/bash


while :
read -p "please input a number: " num
do
	n1=`echo $num | sed 's/[0-9]//g'`
	if [ -n "$n1" ];then
		echo "$num is not a number"
		continue
	else
		echo "is a number"
		break
	fi
done

for i in `seq 1 $num`
do
	for j in `seq 1 $num`
		do
			echo -n "*"
		done
	echo
done
