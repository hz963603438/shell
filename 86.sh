#!/bin/bash

while :
do
	chkconfig --list 2>/dev/null | grep '3:on' | awk '{print $1}' > /tmp/on_ser.txt
	echo -e "\033[32m系统开启了这些服务: \033[0m"
	cat /tmp/on_ser.txt
	echo 
	read -p "请选择要关闭的服务: " s

	if ! grep -qw "$s" /tmp/on_ser.txt;then
		echo -e "\033[31m这个服务不在服务列表.\033[0m"
		continue
	fi 
	chkconfig $s off
	break
done
