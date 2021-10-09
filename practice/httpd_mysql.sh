#!/bin/bash

http=`rpm -qa | grep httpd | wc -l`
#mysql=`rpm -qa | grep mysqld | wc -l`
echo $httpd

if [ $http -eq 0 ];then
	echo '开始安装httpd'
	yum -y install httpd 
else
	echo 'httpd已经安装成功'
	echo '++++++++' $httpd_status

	httpd_status=$(ps -ef | grep [n]ginx | wc -l)
	echo '========'  $httpd_status
	if [ $httpd_status -eq 0 ]; then
		systemctl start httpd
	        if [ $? -eq 0 ];then
			echo 'httpd start success'
		else
			echo 'httpd start failed'
		fi
	else 
		echo 'httpd start already'
	fi
		
fi

#if [ $mysql -eq 0 ];
#	echo '开始安装mysql'
#	yum -y install mysqld
#else 
#	echo 'mysql已经安装成功'
