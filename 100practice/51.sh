#!/bin/bash
#判断一个网址是否正常


curl="www.@baidu.com"
mail_user=963603438@qq.com

code=`curl -I $curl 2>/tmp/curl.err | head -1 | awk '{print $2}'`
if [ -z $code ];then
	python mail.py $mail_user "url访问异常" "`cat /tmp/curl.err`"
	exit
elif [ $code != "200" ];then
	curl -I $url &> /tmp/curl.log
	python mail.py $mail_user "$url访问异常 状态吗$code" "`cat /tmp/curl.log`"
fi
