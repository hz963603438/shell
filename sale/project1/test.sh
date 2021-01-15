#!/bin/bash

read -p "请输入新加员工phone number: " pho

firstnum=`echo $pho | cut -c 1`
result=`cat numberlist | grep $pho `

#if [[ "$firstnum" -ne 0 && -n "$result" ]];then
if [[ "$firstnum" -ne 0 ]] && [ -z $result ];then
	echo "符合"
else
	read -p "输入不合法,请输入新加员工phone number: " pho
fi


#c1=`echo $pho | sed 's/[0-9]//g'`
#if [ -n "$n1" ];then
#	echo "$num is not a number"
#       	read -p "请重新输入新加员工phone number: " pho
#else
#        echo "is a number"
#        break
#fi


#read -p "请输入新加员工family name: " fn
#read -p "请输入新加员工given name: " gn
#read -p "请输入新加员工department number: " dn
#read -p "请输入新加员工job title: " jt

