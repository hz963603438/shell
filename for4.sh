#!/bin/bash
read -t 30 -p "input your name: " name
read -t 30 -p "input the number of users: " num
read -t 30 -p "input your password of users: " passwd
if [ ! -z "$name" -a ! -z "$num" -a ! -z "$passwd" ]
	then
	y=$(echo $num | sed 's/[0-9]//g')
		if [ -z "$y" ]
			then
			for (( i=1;i<=$num;i++ ))
				do
					/usr/sbin/useradd "$name$i" & >/dev/null
					echo $passwd | passwd --stdin "$name$i" & >/dev/null
				done
		fi
fi

