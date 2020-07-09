#!/bin/bash

#port=`netstat -tnlp|grep 21|wc -l`
process=`ps aux|grep [v]sftpd|wc -l`
#port=`nmap -p21 127.0.0.1`
#port_result=$?
port_open=`nmap -p21 127.0.0.1 | grep open | wc -l`


if [ $port_open -ne 1 ];then
	if [ $process -ne 1 ];then
		systemctl start vsftpd
	else
		systemctl restart vsftpd
	fi
fi
