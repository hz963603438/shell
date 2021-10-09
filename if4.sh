#!/bin/bash
#定义变量
num1=$1
num2=$2
 
#判断是否输入两个参数，若是，将两个参数传递给下一个指令动作，若非两个参数，则打印输出内容输出并且退出exit脚本不执行下一个指令
if [ $# -ne 2 ] ;then
   echo 'please input num1 & num2:'
exit
fi
 
#以上判断后，输入的两个参数将传递到如下指令判断
if [ $num1 -gt $num2 ] ; then
   echo $num1 great than $num2
 
elif [ $num1 -lt $num2 ] ; then
   echo $num1 less than $num2
 
else
   echo $num1 equal $num2
 
fi   
