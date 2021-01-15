#!/bin/bash

if [ -d /home/admin/.jvm-sandbox/sandbox/bin ];then
	pid1=`ps aux | grep [j]ava | awk '{print $2}'`
	port1=`netstat -anp | grep $pid1 | awk '{print $4}' | awk -F":::" '{print $2}'`	
	port2=`echo $port1 | awk '{print $1}'`
	echo $port2
else
	mkdir -p /home/admin/.jvm-sandbox
	cd /home/admin/.jvm-sandbox
	wget http://ompc.oss-cn-hangzhou.aliyuncs.com/jvm-sandbox/release/sandbox-stable-bin.zip
	unzip sandbox-stable-bin.zip
	pid1=`ps aux | grep [j]ava | awk '{print $2}'`
        port1=`netstat -anp | grep $pid1 | awk '{print $4}' | awk -F":::" '{print $2}'`
	port2=`echo  $port1 | awk '{print $1}'`
	#echo $port2
fi


 sh /home/admin/.jvm-sandbox/sandbox/bin/sandbox.sh -p $port2 -d "mock-ipromofront-id/trace?class=com.ipay.ipromotion.biz.service.impl.prod.PromoInfoFacadeImpl&method=promoInfoConsult"
 sh /home/admin/.jvm-sandbox/sandbox/bin/sandbox.sh -p $port2 -d "mock-ipromofront-id/trace?class=com.ipay.ipromotion.common.service.integration.ivoucherfront.impl.TemplateManagerFacadeClientImpl&method=create"

