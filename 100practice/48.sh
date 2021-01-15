#!/bin/bash

if_install() {
	rpm -q $1 >/dev/null 2>/dev/null
	if [ $? -eq 0 ];then
		echo "$1已经安装"
		return 0
	else
		echo "$1没有安装"
		return 1
	fi
}

if_install httpd
if [ $? -eq 0 ];then
	if ! pgrep httpd >/dev/null;then
		systemctl start httpd
	fi
else
	yum -y install httpd
fi

if_install mysql-server
if [ $? -eq 0 ];then
	if ! pgrep mysqld >/dev/null;then
		systemctl start mysql
	fi
else
	echo "yum -y install mysql-server"
fi
