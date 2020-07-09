#!/bin/bash

nginx_status=`netstat -tnlp|grep 80| grep nginx|wc -l`
#nginx_status=`netstat -tnlp | grep ':80 ' | wc -l`
httpd_status=`netstat -tnlp|grep 80| grep httpd|wc -l`

if [[ $nginx_status -eq 0 && $httpd_status -eq 0 ]]; then
	echo "没有启动80端口"
	exit 1
fi

if [ $nginx_status -eq 1 ]; then
	echo "启动的是nginx"
elif [ $httpd_status -eq 1 ]; then
	echo "启动的是httpd"
else
	echo "启动的未知服务"
fi

