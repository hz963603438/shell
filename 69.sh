#!/bin/bash

#网站目录
webdir=/data/www/root

#ftp的虚拟用户配置文件目录
ftpudir=/etc/vsftpd/vuuser

#ftp虚拟用户密码文件
ftpuserfile=/root/login

#mysql命令行登录root
mysqlc="/usr/local/mysql/bin/mysql -uroot -pipanel"

#apache虚拟主机配置文件
httpd_config_file="/usr/loca/apache2/conf/extra/httpd-vhosts.conf"

#定义增加mysql库和用户的函数
add_mysql_user() {
	#生成随机密码
	mysql_p=`mkpasswd -s 0 -l 12`
	#将密码保存到临时文件里，这里的$pro为用户自定义的项目名字
	echo "$pro $mysql_p" > /tmp/$pro.txt

	#使用嵌入文档的形式(须顶格)，将创建用户并授权的命令传递给mysql
$mysqlc <<EOF
create database $pro;
grant all on $pro.* to "$pro"@'127.0.0.1' identified by "$mysql_p";
EOF
}

#定义增加ftp用户的函数
add_ftp_user() {
	ftp_p=`mkpasswd -s 0 -l 12`
	echo "$pro" >> $ftpuserfile
	echo "$ftp_p" >> $ftpuserfile

	#将用户、密码文件转换为密码db文件
	db_load -T -t hash -f $ftpuserfile /etc/vsftpd/vsftpd_login.db
	cd $ftpudir

	#这里的aaa是一个文件，是之前的一个项目，可以作为配置模板
	cp aaa $pro
	
	#把里面的aaa改为新的项目名字
	sed -i "s/aaa/$pro/" $pro

	systemctl restart vsftpd
}

#定义增加apache虚拟主机的函数
config_httpd() {
	mkdir $webdir/$dom
	chown vsftpd:vsftpd $webdir/$dom

	#用嵌入文档(需顶格)，把虚拟主机配置写到配置文件里
cat >> $httpd_config_f << EOF
<VirtualHost *:80>
	DocumentRoot $webdir/$dom
	ServerName $dom
	<Directory $webdir/$dom>
		AllowOverride none
	Require all granted
	</Directory>
</VirtualHost>
EOF

	#重载apache服务
	/usr/local/apache2/bin/apachectl graceful
}

read -p "input the project name: " pro
read -p "input the domain: " dom

add_mysql_user
add_ftp_user
config_httpd
