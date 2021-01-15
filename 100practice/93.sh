#!/bin/bash

if [ $# -ne 1 ];then
	echo "运行脚本的格式为: $0 /dir/"
	exit 1
else
	if ! echo $1 | grep -q '^/.*'
	then
		echo "请输入一个绝对路径"
		exit 1
	fi
fi

if ! rpm -q samba > /dev/null
then
	echo "将要安装samba"
	sleep 1
	yum -y install samba
	if [ $? -ne 0 ];then
		echo "samba install fail"
		exit 1
	fi
fi

cfgdir=/etc/samba/smb.conf
cat >> $cfgdir <<EOF
[share]
	comment = share all
	path = $1
	browseable = yes
	public = yes
	writable = no
EOF

if [ ! -d $1 ];then
	mkdir =p $1
fi

chmod -R 777 $1
echo "123" > $1/123.txt

systemctl start smb
if [ $? -eq 0 ];then
	echo "samba配置完毕"
else
	echo "samba服务启动失败，检查配置文件"
fi
