#!/bin/bash

read -p "输入不少于五个城市的名字，用空格分隔开: " name
n=`echo $name | awk '{print NF}'`

if [ $n -lt 5 ];then
	echo "请输入不少于5个城市名称"
	exit
fi

#echo $name

city=($name)
echo ${city[@]}

for i in `seq 0  $((${#city[@]}-1))`
do
	echo ${city[$i]}
done 
