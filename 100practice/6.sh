#!/bin/bash

m=123@163.com
while :
do
	n=`netstat -tnlp | grep ":80 " | wc -l`
	if [ $n -eq 0 ];then
		systemctl start nginx
		pn=`pgrep -l nginx | wc -l`
		if [ $pn -eq 0 ];then
			echo '启动失败'
		fi
	fi
	sleep 10
done
