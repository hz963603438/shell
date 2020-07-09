#!/bin/bash

for ip in `cat /tmp/ip.list`
do
	echo $ip
	ssh $ip "uptime"
done
