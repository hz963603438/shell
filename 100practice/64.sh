#!/bin/bash

s_ip=8.8.8.8
url=www.baidu.com
ip_list=/tmp/ip.list

curl -x$s_ip:80 $url 2>/dev/null >/tmp/source.log
for ip in `cat $ip_list`
do
	curl -x$ip:80 $url 2>/dev/null >/tmp/$ip.log
	diff /tmp/source.log /tmp/$ip.log >/tmp/$ip.diff
	
	n=`wc -l /tmp/$ip.diff | awk '{print $1}'`
	if [ $n -gt 0 ];then
		echo "节点$ip有异常"
	fi
done
