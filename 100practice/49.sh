#!bin/bash

if [ $# -ne 1 -o ${#1} -ne 8 ];then
	echo "请输入正确的格式"
	exit 1
fi

y=`echo ${1:0:4}`
m=`echo ${1:4:2}`
d=`echo ${1:6:2}`
echo $y $m $d

if echo $d | grep -q "^0";then
	d=`echo $d | sed 's/^0//'`
fi

if cal $m $y >/dev/null 2>/dev/null;then
	if cal $m $y | grep -qw "$d";then
		echo "日期合法"
	else
		echo "你给的日不对"
	fi
else	
	echo "你给的日期年月不对"
fi
