#!/bin/bash

num=`ps -ef | grep [g]mping | wc -l`

if [ $num -eq 0 ];then
	echo "ping服务器不正常"
else
	echo "ping 服务正常"
fi
