#!/bin/bash


while :
do
	t=`date +%T`
	iostat -xd 1 5 | grep '^sda' >/tmp/io.log
	sum=`awk '{sum=sum+$NF} END {print sum}' /tmp/io.log`
	a=`echo "scale=2;$sum/5" | bc`
	b=`echo $a | cut -d . -f 1`
	if [ $b -gt 90 ];then
		mysql -uroot -pipanel -e "show processlist" > mysql_$t.log
	else
		echo "磁盘io正常"
	fi
	sleep 1
done
