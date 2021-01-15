#!/bin/bash

m=`echo $RANDOM`
n=$[$m%100]
echo $n

while true; do
read -p "猜猜我的苹果多少钱一斤: " num

if [[ ! $num =~ ^[0-9]+$ ]]; then
        echo "请输入数字"
	exit 1
fi


if [ $num -lt $n ]; then
	echo "少了，再往大猜点"
elif [ $num -gt $n ]; then
	echo "大了，再往小猜点"
elif [ $num -eq $n ]; then
	echo "猜对了  congratulations"
	exit 2
fi

done
