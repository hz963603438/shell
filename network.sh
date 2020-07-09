#!/bin/bash

read -p "请输入网卡名称: " net

network=`ifconfig $net 2>/dev/null | awk 'NR==2 {print $2}'`
errnet=`ifconfig $net &>/dev/null;echo $?`

if [ $errnet -eq 1 ];then
	echo "你输入的网卡名称错误"
	exit 1
else
	echo "你输入的网卡名称是:" $net
	echo "网卡的ip地址是:" $network

fi

