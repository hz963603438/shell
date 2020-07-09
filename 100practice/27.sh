#!/bin/bash

#if [ $# -eq 0 ] || [ $# -gt 2 ];then
if [ $# -eq 0 -o $# -gt 2 ];then
	echo "wrong, sh $0 --add username,or sh $0 --delete username or sh $0 --help"
	exit
fi

add_user() {
	if ! id $1 2>/dev/null >/dev/null
	then
		useradd $1 && echo "$1 add successful"
	else
		echo $1 exist
		exit
	fi
}

del_user() {
	if id $1 2>/dev/null >/dev/null
	then
		userdel $1 && echo "$1 del successful"
	else
		echo $1 not exist
	fi
}

case $1 in
	--add)
		if [ $# -eq 1 ];then
			echo "wrong,use sh $0 --add user or sh $0 --add user1,user2,user3..."
			exit
		else
			n=`echo $2 | awk -F, '{print NF}'`
			if [ $n -gt 1 ];then
				for i in `seq 1 $n`
				do
					username=`echo $2 | awk -v j=$i -F, '{print $j}'`
					add_user $username
				done
			else
				add_user $2
			fi
		fi
		;;
	--del)
		if [ $# -eq 1 ];then
                        echo "wrong,use sh $0 --del user or sh $0 --del user1,user2,user3..."
                        exit
                else
		 n=`echo $2 | awk -F, '{print NF}'`
                        if [ $n -gt 1 ];then
                                for i in `seq 1 $n`
                                do
                                        username=`echo $2 | awk -v j=$i -F, '{print $j}'`
					del_user $username
                                done
                        else
                                del_user $2
                        fi
                fi
                ;;
	--help)
		if [ $# -ne 1 ];then
			echo "wrong,use sh $0 --help"
			exit
		else
			echo "use sh $0 --add usernmae or sh $0 --add user1,user2,user3..."
			echo "use sh $0 --del usernmae or sh $0 --del user1,user2,user3..."
			echo "use sh $0 --help print this info"
		fi
		;;
	*)
		echo "finally!  wrong, sh $0 --add username,or sh $0 --delete username or sh $0 --help"
esac
