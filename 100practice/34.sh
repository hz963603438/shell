#!/bin/bash

n=$(($RANDOM%101))
echo $n

while :
do
	read -p	"please input a number of range 0-100: " num
	if [ -z $num ];then
		echo "you must input a number"
		continue
	fi
	num2=`echo $num | sed 's/[0-9]//g'`
	if [ -n "$num2" ];then
		echo "please input a pure number"
		continue
	else
		if [ $num -gt $n ];then
			echo "you input the number is big"
		elif [ $num -lt $n ];then
			echo "you input the number is small"
		else
			echo "bingo"
			exit 
		fi
	fi
done
