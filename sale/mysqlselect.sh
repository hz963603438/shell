#!/bin/bash


while :
do

HOST="rm-j6cfyp3a5355xf7yhmo.mysql.rds.aliyuncs.com"
USER="alick1995"
PASSWD="Zhangjiuhang2"

read -p "请输入要查询的域名: " domain


mysql -h$HOST -u$USER -p$PASSWD -e"use alick1995;select pid,license_code,expiry from product_licenses where domains='$domain'" 2>/dev/null
mysqldata=`mysql -h$HOST -u$USER -p$PASSWD -e"use alick1995;select pid,license_code,expiry from product_licenses where domains='$domain'" 2>/dev/null`

if [ -z "$mysqldata" ];then
	echo "该域名没能查询到数据 ======= "
	read -p "请输入license_code: " code
	licensecode=`mysql -h$HOST -u$USER -p$PASSWD -e"use alick1995;select license_code from product_licenses where license_code='$code'" 2>/dev/null`
	#echo "==== $licensecode ====="
	if [ -z "$licensecode" ];then
		echo "没有该license_code"
	else
		domaindata=`mysql -h$HOST -u$USER -p$PASSWD -e"use alick1995;select domains from product_licenses where license_code='$code'" 2>/dev/null`
		#echo "++++++ $domaindata ++++++"
		if echo "$domaindata" | grep -qw "NULL" ;then
			read -p "请输入要授权的域名: " DOMAIN
			mysql -h$HOST -u$USER -p$PASSWD -e"use alick1995;update product_licenses set domains='$DOMAIN' where license_code='$code'" 2>/dev/null
			echo "域名写入完毕"
		else
			echo "该license_code已经有域名了"
		fi
	fi
else 
	echo "该域名能查询到数据,请继续 !!!!!!!"

fi

done
