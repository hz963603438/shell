#!/bin/bash

#PS3="please input your choice(1-4): "
#select i in w ls pwd quit huzheng
#do
#	case $i in
#	w)
#		w
#		;;
#	ls)
#		ls
#		;;
#	pwd)
#		pwd
#		;;
#	quit)
#		exit
#		;;
#	*)
#		echo "please input 1-3"
#		;;
#	esac
#done

echo -e "1) w\n2) ls\n3) pwd\n4) quit"
while :
do
read -p "please input your choice(1-4): " c
case $c in
	1)
		w
		;;
	2)
		ls
		;;
	3)
		pwd
		;;
	4)
		exit
		;;
	*)
		echo "please input 1-4"
		;;
esac
done
