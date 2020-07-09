#!/bin/bash

if [ $# -ne 2 ];then
	echo "have to input two parameter, first parameter is url,second parameter is director"
	exit 1
fi

if [ ! -d $2 ];then
	read -p "the second parameter isn't director,是否要创建该目录(y|n): " c
	#while :
	#do
	case $c in
		y|Y)
			mkdir -p $2
			;;
		n|N)
			exit 51
			;;
		*)
			echo "please input y or n"
			continue
			;;
	esac
	#done
else
	cd $2
	wget $1
	if [ $? -eq 0 ];then
		exit 0
	else
		echo "download faild"
		exit 52
	fi
fi

	

DOWNLOAD() {
	echo 111

}


