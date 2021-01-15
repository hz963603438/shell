#!/bin/bash

ip_list="192.168.96.136 192.168.96.132"


for ip in $ip_list 
	do
		num=1
		while [ $num -le 3 ]; do
			if ping -c 1 $ip &>/dev/null;then
				echo "$ip ok"
				break
			else
				fail_count[$num]=$ip
				let num++
				echo "$ip no" $num
			fi
		done
		if [ ${#fail_count[*]} -eq 3 ]; then
			echo "${fail_count[1]} ping is failure"
			unset fail_count[*]
		fi
	done
