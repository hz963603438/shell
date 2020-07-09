#!/bin/bash

ip add | awk -F ": " '$1 ~ "^[0-9]" {print $2}' >/tmp/eth.list
while :
do
	eths=`cat /tmp/eth.list | xargs`
	read -p "please input a ethname(the eths is `echo -e "\033[31m$eths\033[0m"`): " eth
	if [ -z "eth" ];then
		echo "please input a ethname"
		continue
	fi
	if ! grep -qw "$eth" /tmp/eth.list;then
		echo "the ethname is error"
		continue
	else
		break
	fi

done

if_ip() {
	ip add show dev $1 | grep ' inet ' | awk '{print $2}' | awk -F"/" '{print $1}' >/tmp/$1.txt
	n=`wc -l /tmp/$1.txt | awk '{print $1}'`
	if [ $n -eq 0 ];then
		echo "the $1 no ip address"
	else
		echo "the $1 ip address is:"
		for ip in `cat /tmp/$1.txt`
		do
			echo -e "\033[33m$ip\033[0m"
		done
	fi
}
if_ip $eth
