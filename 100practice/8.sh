#!/bin/bash

log=/data/log/access.log

while :
do
n_502=`tail -200 $log | grep -c 502`
if [ -z "$502_n" ];then
	exit
fi

if [ $502_n -gt 100 ];then
	systemctl start php-fpm
	fpm_n=`pgrep -l php-fpm | wc -l`
	if [ $fpm_n -eq 0 ];then
		echo 'php-fpm 启动失败'
		exit
	fi
fi
sleep 10
done
