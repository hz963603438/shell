#!/bin/bash

myfun() {
	if [ $# -lt 2 ];then
		echo "para num error1"
		exit 1
	fi
	echo "ok"
	exit 2
}

if [ $# -lt 1 ];then
	echo "para num error2"
	exit 250                    #当脚本参数小于1，这里exit返回的48，可以输入$?显示出来
	#echo $?
fi

returnval=`myfun aa`
echo $returnval
echo $?
echo "end shell"
exit 0 

#function myfun()  
#{  
#    if [ $# -lt 2 ]  
#    then  
#       echo "para num error2"  
#       exit 1  
#    fi  
#    echo "ok"  
#    exit 2  
#}  
#if [ $# -lt 1 ]  
#then  
#   echo "para num error1"  
#    exit 1  
#fi
#returnVal=`myfun aa`  
#echo $returnVal
#myfun aa
#echo "end shell"  
#exit 0 
