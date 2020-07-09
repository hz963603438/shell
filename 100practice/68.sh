#!/bin/bash

ps -elf > /tmp/pid.txt
read -p "please input a pid: " p

if [ -z $p ];then
	echo "please input a pidnumber"
	exit
fi

if ! grep -qw $p /tmp/pid.txt;then
	echo "你输入的pid不存在"
	exit
fi

get_childpid() {
	p1=$1
	ps -elf | awk -v p2=$p1 '$5==p2 {print $4}' > /tmp/$p1.txt
	n=`wc -l /tmp/$p1.txt | awk '{print $1}'`

	if [ $n -eq 0 ];then
		echo "进程$1下没有子进程" 
	else
		echo "进程$1下子进程是: "
		cat /tmp/$p1.txt
	fi
}

get_childpid $p

for parent_pid in `cat /tmp/$p.txt`
do
	get_childpid $parent_pid
done
