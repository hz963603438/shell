#!/bin/bash

logs_path=/usr/local/openresty/nginx/logs
day=`date -d 'yesterday' +%Y-%m-%d`

function logrotate(){
	mv $logs_path/error.log $logs_path/error-$day.log
	mv $log_path/access.log $logs_path/access-$day.log
	/usr/local/openresty/nginx/sbin/nginx -s reopen  #重新打开日志文件
}


cronstatus=`cat /var/spool/cron/root | grep logrotate`
croncontent="1 0 * * * /usr/local/openresty/logrotate.sh rotate &"

if [ "$cronstatus" != "" ];then
	echo "crontab on"
else
	echo "$croncontent" >> /var/spool/cron/root
	echo "crontab start successed"
fi

if [ "$1" == "rotate" ];then
	logrotate
fi

#定时任务
#1 0 * * * /usr/local/openresty/logrotate.sh rotate & 
