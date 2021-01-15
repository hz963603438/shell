#!/bin/bash

#IPLIST="10.1.1.1 10.1.1.2 10.1.1.3 10.1.1.4 10.1.1.5 10.1.1.6 10.1.1.7 10.1.1.8 10.1.1.9 10.1.1.10"


IPLIST="192.168.96.200 192.168.96.187"

for host in $IPLIST
do
	#ssh $host "source /etc/profile;ls /root"
	#ssh $host "source /etc/profile;sed -i 's/10.1.1.1/192.168.96.100/g' /etc/guacamole/guacamole.properties"
	ssh $host "source /etc/profile;sed -i 's/10.1.1.1/192.168.96.100/g' /tmp/ipchange.txt"
	echo "===========   $host服务器修改完成   =============="
done


