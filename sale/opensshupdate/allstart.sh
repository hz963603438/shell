#!/bin/bash

cd $(cd `dirname $0`;pwd)

cat passwd.txt | while read line

do

password=`echo $line | awk '{print $3}'`
ipaddr=`echo $line | awk '{print $1}'`
#sshpass -p $password ssh $ipaddr "source /etc/profile;sh /root/opensshupdate/opensshupdate.sh;ls /root;exit"


cat > /tmp/rs_slave.expect <<EOF
#!/usr/bin/expect
set passwd "$password"
spawn ssh $ipaddr
expect {
        "yes/no" { send "yes\r" }
        "password:" { send "\$passwd\r" }
}
expect -re ".*\[\$#\]"
send "sh /root/opensshupdate/opensshupdate.sh\r"
expect -re ".*\[\$#\]"
send "exit\r"
expect eof
EOF

chmod +x /tmp/rs_slave.expect
/tmp/rs_slave.expect

done

rm -rf /tmp/rs_slave.expect
