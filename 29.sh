#!/bin/bash
is_num() {
	num=`echo $1 | sed 's/[0-9]//g'`
	if [ -n "$num" ];then
		echo "给出的参数必须是正整数"
		exit
	fi
}

if [ $# -ne 2 ];then
	echo "必须要输入两个参数"
	exit
else
	is_num $1
	is_num $2
fi

big() {
	if [ $1 -gt $2 ];then
		echo $1
	else
		echo $2
	fi
}

small() {
	if [ $1 -lt $2 ];then
		echo $1
	else
		echo $2
	fi
}

add() {
	sum=$(($1+$2))
	echo "$1+$2=$sum"
}

jian() {
	b=`big $1 $2`
	s=`small $1 $2`
	cha=$(($b-$s))
	echo "$b-$s=$cha"
}

cheng() {
	ji=$(($1*$2))
	echo "$1x$2=$ji"
}

chu() {
	b=`big $1 $2`
	s=`small $1 $2`
	#v=`echo "scale=2;$b/$s"|bc`
	#echo "$b/$s=$v"
	shang=$(($b/$s))
	echo "$b/$s=$shang"
}

add $1 $2
jian $1 $2
cheng $1 $2
chu $1 $2
