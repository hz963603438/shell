#!/bin/bash

function echo_color() {
        if [ $1 == "green" ]; then
                echo -e "\033[32;40m$2\033[0m"
        elif [ $1 == "red" ]; then
                echo -e "\033[31;40m$2\033[0m"
        fi
}


for user in user{1..5}; do
	if ! id $user &>/dev/null; then
		useradd $user >/dev/null
		pass=`echo $RANDOM | md5sum |cut -c 1-8`
		echo $pass | passwd --stdin $user >/dev/null
		echo -e "$user\t$PASS" >> user_file
		echo "$user user create successful"
	else
		echo_color red "$user already exists"
	fi
done


