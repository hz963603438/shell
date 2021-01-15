#!/bin/bash

mysql="/usr/local/mysql/bin/mysql -uroot -pipanel"
if ! $mysql -e "show processlist" >/dev/null 2>/dev/null ;then
	echo "mysql service is down"
	exit
else
	$mysql -e "show slave status\G" 2>/dev/null >/tmp/slave.status
	num=`wc -l /tmp/slave.status | awk '{print $1}'`
	if [ $num -eq 0 ];then
		echo "this is master"
	else
		echo "this is slave"
		egrep -i 'slave_io_running:|slave_sql_running:' /tmp/slave.status | awk -F': ' '{print $2}' > /tmp/sql.tmp
		if grep -qw "No" /tmp/sql.tmp;then
			echo "the slave is down"
		fi
	fi
fi

 
