iptables -F INPUT
iptables -P INPUT DROP
iptables -A INPUT -s 192.168.96.142 -j ACCEPT
