#!/bin/bash

if read -t 5 -p "输入网站名称: " website
then
	echo "你输入的网站名称是 $website"
else
	echo -e "\n抱歉，你输入超时了"
fi
exit 0

