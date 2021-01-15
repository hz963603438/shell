#!/bin/bash

cd $(cd `dirname $0`;pwd)

cat passwd.txt | while read line

do
#echo $line
password=`echo $line | awk '{print $3}'`
ipaddr=`echo $line | awk '{print $1}'`
echo $password $ipaddr

cat > /tmp/rs_slave.expect <<EOF
#!/usr/bin/expect
set passwd "$password"
spawn rsync -ar /root/shell/sale $ipaddr:/root
expect {
        "yes/no" { send "yes\r" }
        "password:" { send "\$passwd\r" }
}
expect eof
EOF

chmod +x /tmp/rs_slave.expect
/tmp/rs_slave.expect

done

rm -rf /tmp/rs_slave.expect
