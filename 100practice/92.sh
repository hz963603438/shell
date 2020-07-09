#!/bin/bash

while true
do
	read -p "输入要执行的操作: (start|stop|rm)" opt
	if [ -z $opt ];then
		echo "请输入要执行的操作"
		continue
	else
		break
	fi
done

docker ps -a | awk '{print $1}' > /tmp/id.txt
case $opt in
	start)
		for i in `cat /tmp/id.txt`
		do
			docker start $id
		done
		;;
	stop)
		for i in `cat /tmp/id.txt`
		do
			docker stop $id
		done
		;;
	rm)
		for i in `cat /tmp/id.txt`
		do
			read -p "将要删除容器$id,是否继续？(y|n)" c
			case $c in
				y|Y)
					docker rm -f $id
					;;
				n|N)
					echo "容器$id不会被删除"
					;;
				*)
					echo "你只能输入'y'或者'n'"
					;;
			esac
		done
	*)
		echo "你只能输入start|stop|rm"
		;;
esac
