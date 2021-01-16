#!/bin/bash

#IPLIST填要连接服务器的ip
IPLIST="192.168.96.206 192.168.96.128 192.168.96.187"

#arry1填修改前的ip
#arry1=(10.1.1.1 10.1.1.2 10.1.1.3)

#arry2填修改后的ip
arry2=(172.16.134.1 172.16.134.2 172.16.134.3)

i=0
for host in $IPLIST
do
	#ssh $host "source /etc/profile;sed -i "s/${arry1[$i]}/${arry2[$i]}/" /tmp/ipchange.txt"
	#ssh $host "source /etc/profile;sed -i "s/${arry1[$i]}/${arry2[$i]}/" /etc/guacamole/guacamole.properties"
	ssh $host "source /etc/profile;sed -i "s/guacd-hostname-confidence[0-9]*.*/guacd-hostname-confidence:${arry2[$i]}/" /etc/guacamole/guacamole.properties"
	let i++
	echo $i
	echo "===========   $host服务器修改完成   =============="
done
