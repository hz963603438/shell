#!/bin/bash

m=13242095170@163.com

c=`ping -c5 182.92.159.67 | grep packet | awk -F% '{print $1}' | awk '{print $NF}' `
if [ -z $c ];then
	echo "获取访问次数为空"
	python mail.py $m "检测机器存活脚本$0有问题" "获取变量的值为空"
	exit
else
	c1=`echo $c | sed 's/[0-9]//g'`
	if [ -n $c1 ];then
		echo "获取访问次数不是纯数字"
		python mail.py $m "检测机器存活脚本$0有问题" "获取变量的值不是纯数字"
        	exit
	fi
fi
 

while :
do
	if [ $c -eq 10 ];then
		python /root/shell/mail.py $m "机器宕机" "丢包率是$n%"
	else
		echo "182.92.159.67主机正常"
	fi
	sleep 10
done
