#!/bin/bash

check_service() {
	n=0
	for i in `seq 1 5`
	do
		systemctl restart nginx 2>/tmp/nginx.err
		if [ $? -ne 0 ];then
			n=$(($n+1))
		else
			break
		fi
	done
	if [ $n -eq 5 ];then
		python mail.py "123@1163.com" "nginx start faild" `cat /tmp/nginx.err`
		exit
	fi
}

while true
do
	t_n=`ps -C nginx --no-heading | wc -l`
	if [ $t_n -ge 500 ];then
		systemctl start nginx
		if [ $? -ne 0 ];then
			check_service
		fi
		sleep 60
		t_n=`ps -C nginx --no-heading | wc -l`
		if [ $t_n -ge 500 ];then
			python mail.py "123@163.com" "nginx service somth wrong" "the nginx process is buay"
			exit
		fi
	fi
	sleep 10
done
