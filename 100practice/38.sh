#!/bin/bash

for i in `seq 160 180`
do
	if ping -c 2 -W 2 192.168.96.$i >/dev/null 2>&1;then
		echo "192.168.96.$i是通的"
	else	
		echo "192.168.96.$i不通"
	#fi	
done
