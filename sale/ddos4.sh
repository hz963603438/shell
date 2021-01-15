#!/bin/bash

func1() {
while :
sleep 10
do

	netstat -na|grep SYN_RECV | awk '{print $5}' | awk -F: '{print $1}' | sort | sort -rn | grep -v -E '192.168|127.0' | awk '{print $1}' > /tmp/dropip2.txt

	for IP in `cat /tmp/dropip2.txt`
	do
        	echo "即将对$IP进行封杀"
	done


	read -p "are u sure kill these ip, y/n: " cho
	case $cho in
		"y")
			for i in `cat /tmp/dropip2.txt`
       	 		do
                		iptables -A INPUT -s $i -j DROP
                		echo "$i kill now"
        		done
        
        		read -p "are you sure continue,input y/n: " choice
        		case $choice in
                		"y")
                        		echo "the script still run"
                        		;;
                		"n")    
                        		break
                        		;;
        		esac
			;;
		"n")
			break
			;;
	esac

#把过滤出来的ip用iptables进行drop

#	for i in `cat /tmp/dropip2.txt`
#	do
#        	iptables -A INPUT -s $i -j DROP
#        	echo "$i kill now"
#	done
#	
#	read -p "are you sure continue,input y/n: " choice
#	case $choice in
#		"y")
#			echo "the script still run"
#			;;
#		"n")	
#			break
#			;;
#	esac

done
}

func1

