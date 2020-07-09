#!/bin/bash

/usr/sbin/iptables -A INPUT -p tcp -m tcp --dport 2000:5000 -j ACCEPT
/usr/sbin/iptables -A INPUT -p tcp -m tcp --dport 7000:65000 -j ACCEPT
/usr/sbin/iptables -A INPUT -p tcp -m multiport --dports 21,22 -j ACCEPT
/usr/sbin/iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
/usr/sbin/iptables -A INPUT -p tcp -m tcp --dport 111 -j ACCEPT
/usr/sbin/iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
/usr/sbin/iptables -A INPUT -p tcp -m tcp --dport 873 -j ACCEPT
/usr/sbin/iptables -A INPUT -s 10.68.31.31/24,10.68.31.32/24 -j ACCEPT
/usr/sbin/iptables -A INPUT -s 10.68.23.199/24,10.68.23.200/24,10.68.23.201/24,10.68.23.202/24,10.68.23.203/24,10.68.23.204/24,10.68.23.205/24,10.68.23.206/24 -j ACCEPT
/usr/sbin/iptables -A INPUT -s 10.68.23.207/24,10.68.23.208/24,10.68.23.209/24,10.68.23.210/24,10.68.23.211/24,10.68.23.212/24 -j ACCEPT
