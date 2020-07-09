#!/bin/bash

version=`awk -F"release " '{print $2}' /etc/redhat-release | awk -F. '{print $1}'`
user() {
	if [ $1 -eq 0 ];then
		echo "系统没有自定义的用户"
	else
		echo "系统自定义的用户有$1个"
	fi
}

case $version in
	5|6)
		n=`awk -F: '$3>=500 {print $3}' /etc/passwd | wc -l`
		user $n
		;;
	7)
		n=`awk -F: '$3>=1000 {print $3}'  /etc/passwd | wc -l`
		echo $n
		user $n
		;;
	*)
		echo "不支持该系统版本"
		;;
esac
