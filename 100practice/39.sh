#!/bin/bash

sh -n $1 2>/tmp/sh.err

if [ $? -ne 0 ];then
	cat /tmp/sh.err
	read -p "请输入q/Q退出脚本: " c

	if [ -z $c ];then
		vim $1
		exit 0
	fi	

	if [ $c == q -o $c == Q ];then
		exit 0
	else
		vim $1
		exit 0
	fi
else
	echo "$1脚本没语法错误"
fi
