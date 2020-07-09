#!/bin/bash

FILE=/tmp/user_number.txt

judge_n() {
	while :
		do
			n=$((RANDOM%100))
			if awk '{print $2}' $FILE | grep -qw $n;then
				continue
			else
				break
			fi
		done
}


while :
do
	read -p "please input a username: " u
	if [ -z "$u" ];then
		echo "请输入用户名"
		continue
	fi

	if [ $u == "q" -o $u == "Q" ];then
		exit 1
	fi
		
	u1=`echo $u | sed 's/[a-Z0-9]//g'`
	if [ -n "$u1" ];then
		echo "the username is made up of numbers and letters"
		continue
	else
		if [ -f $FILE ];then
			u_n=`awk -v uu=$u '$1==uu {print $2}' $FILE`
			if [ -n "$u_n" ];then
			#if awk -v uu=$u '$1==uu' $FILE;then
				#echo "username exist, 用户$u对应的数字是`grep -w "$u" $FILE | awk '{print $2}'`"
				echo "用户数字已存在,用户$u对应的数字是: $u_n"
			else
				judge_n
				echo "用户$u对应的数字是: $n"
				echo $u $n >> $FILE
			fi
		else
			jduge_n 
                        echo "用户$u对应的数字是: $n"
                        echo $u $n >> $FILE
		fi
	fi
done
