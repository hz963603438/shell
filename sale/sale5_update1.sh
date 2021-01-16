#!/bin/bash

#IPLIST填要连接服务器的ip
IPLIST="192.168.96.200 192.168.96.187"

#arry1填修改前的ip
arry1=(10.1.1.1 10.1.1.2)

#arry2填修改后的ip
arry2=(172.16.134.1 172.16.134.2)

i=0
for host in $IPLIST
do
	#ssh $host "source /etc/profile;sed -i "s/10.1.1.1/${arry1[$i]}/" /tmp/ipchange.txt"
	ssh $host "source /etc/profile;sed -i "s/${arry1[$i]}/${arry2[$i]}/" /etc/guacamole/guacamole.properties"
	ssh $host "source /etc/profile;sed -i "s/guacd-hostname-confidence:[0-Z]*/guacd-hostname-confidence:${arry2[$i]}/" /etc/guacamole/guacamole.properties"
	let i++
	echo $i
	echo "===========   $host服务器修改完成   =============="
done


