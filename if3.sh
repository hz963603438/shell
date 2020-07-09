#!/bin/bash

port=$(nmap -sT 192.168.96.128 | grep tcp | grep mysql | awk '{print $2}')

if [ "$port" == "open" ]
	then 	
		echo "$(date) httpd is ok!!" >> /tmp/mysqld_acc.log
	else
		/etc/init.d/mysql start &> /dev/null
		echo "$(date) httpd reboot" >> /tmp/mysql_err.log
fi
