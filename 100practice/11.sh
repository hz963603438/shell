#!/bin/bash

read -p "please input a number: " num
 
if [ -z $num ];then
	echo '请输入一个数字，范围1-4'
fi


n=`echo $num|sed 's/[0-9]//g'`

if [ -n "$n" ];then
	echo '请输入一个纯数字'
	exit
fi
	

case $num in
	0)
	   echo '000';
	   ;;
	1)
	   echo '111';
	   ;;
	2)
	   echo '222';
	   ;;
	*)
	   echo 'please input a number 0-2'
esac
