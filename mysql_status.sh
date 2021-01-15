#!/bin/bash

ip=192.168.96.
user=root
pass=ipanel
sync_date=`date +%F`


for i in {136..137};do
	echo $i $ip$i
	/usr/local/mysql/bin/mysql -h$ip$i -u$user -p$pass -e "show slave status\G" 2>/dev/null |egrep -i 'running:' >> /root/shell/status.txt
	#echo =====  $mysql_conn  =====
	#echo $mysql_conn >> status.txt 

	if [ ! -s /root/shell/status.txt ];then  # ! -s表示存在且为空
		echo "当前操作的是主库"
		exit 1 
	fi


  	io=`grep IO /root/shell/status.txt |awk '{print $2}'`	
  	sql=`grep SQL /root/shell/status.txt |awk '{print $2}'`	
	#if [ ! -f status.txt ];then
	#	echo "mysql状态文件不存在"
	#	exit 1
	#fi
	if [[ $io == "Yes" && $sql == "Yes" ]]; then
		echo "当前mysql主从状态ok"
	else
		/usr/bin/mail -s "$sync_date-$ip$i主从同步失败" 963603438@qq.com < /root/shell/status.txt
		echo "io状态是"$io
		echo "sql状态是"$sql
	fi
	
done
