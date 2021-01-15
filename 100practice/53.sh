#!/bin/bash
#解封22端口

iptables -nvL INPUT --line-numbers | grep -w 'dpt:22' | awk '$4 ~/REJECT|DROP/ {print $1}' > /tmp/iptables.log

num=`wc -l /tmp/iptables.log | awk '{print $1}'`

if [ $num -gt 0 ];then
	for n in `tac /tmp/iptables.log`
	do		
		iptables -D INPUT $n
	done
fi
