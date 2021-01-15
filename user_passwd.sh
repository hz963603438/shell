#!/bin/bash

if [ $UID -ne 0 ]; then
	echo "请使用root账户执行创建用户"
	exit 1
fi

for i in `seq -w 0 10`
do 
	username=user_$i
	pass=`mkpasswd -l 10 -C 3 -c3 -d 2 -s 2`
	id $username &>/dev/null
	if [ $? -eq 1 ];then
		useradd $username  &>/dev/null
		echo "$pass" | passwd --stdin $username &>/dev/null
		id $username &>/dev/null
		if [ $? -eq 0 ];then
			echo "useradd $username is Success"
		else
			echo  "useradd $username is Error"
		fi
	else
		echo "useradd $username is already exists"
	fi
		echo -e "$username \t $pass" >> /tmp/user.txt
	
done
