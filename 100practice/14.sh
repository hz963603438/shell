#!/bin/bash

block_ip() {

	t1=`date -d "-1 min" +%Y:%H:%M`
	log=/root/shell/100practice/1.log

	#egrep "$t1:[0-9]+" $log > /tmp/tmp_last_min.log
	#awk '{print $1}' /tmp/tmp_last_min.log | sort -n | uniq -c | sort -n | awk '$1>2 {print $2}' > /tmp/bad_ip.list
	n=`wc -l /tmp/bad_ip.list | awk '{print $1}'`

	if [ $n -ne 0 ];then
		for ip in `cat /tmp/bad_ip.list`
		do
			iptables -I INPUT -s $ip -j DROP
		done
	fi
}

unblock_ip() {
	iptables -nvL INPUT | sed '1d' | awk '$1<5 {print $8}' > /tmp/good_ip.list
	n=`wc -l /tmp/good_ip.list | awk '{print $1}'`
	if [ $n -ne 0 ];then
		for ip in `cat /tmp/good_ip.list`
		do
			iptables -D INPUT -s $ip -j DROP
		done
		iptables -Z INPUT
	fi
}

t=`date +%M`
if [ $t == "00" ] || [ $t == "30" ];then
	unbloak_ip
	block_ip
else
	block_ip
fi
