#!/bin/bash

n=`netstat -tnlp | grep ':21 ' | wc -l`

if [ $n -eq 0 ];then
	echo "21端口没有监听"
else
	service=`netstat -tnlp | grep ':21 ' | awk -F'/' '{print $NF}'| sed 's/ //g'`
	echo "21端口运行的是$service"
fi
