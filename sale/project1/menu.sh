#!/bin/bash

cd $(cd `dirname $0`;pwd)

if [ ! -f "records" ];then
	echo "records file not exist"
	exit
fi


while :
do

echo "在屏幕上显示所有当前员工记录,请输入1"
echo "搜索并显示特定的员工记录,请输入2"
echo "将新员工记录添加到记录文件中,请输入3"
echo "从记录文件中删除员工记录,请输入4"
echo "退出脚本,请输入exit"

read -p "请输入您的选择: " opt
case $opt in
	"1")
		echo -e "\033[32;40m"======================================="\033[0m"
		echo -e "\033[31;40m"所有员工信息如下"\033[0m"
		cat records
		echo -e "\033[32;40m"======================================="\033[0m"
		;;
	"2")
		read -p "请输入要查询的员工电话号码: " number
		echo -e "\033[32;40m"======================================="\033[0m"
		echo -e "\033[31;40m"要查询的员工信息如下"\033[0m"
		cat records | grep $number
		echo -e "\033[32;40m"======================================="\033[0m"
		;;
	"3")
		add() {
		read -p "请输入新加员工phone number: " pho
		
		judgnum() {
		n1=`echo $1 | sed 's/[0-9]//g'`
                if [ -n "$n1" ];then
                	echo "$num is not a number"
                fi
		

		firstnum=`echo $1 | cut -c 1`
		result=`cat numberlist | grep $pho `
		if [[ "$firstnum" -ne 0 ]] && [ -z $result ];then
        		echo "符合"
		else
        		read -p "输入不合法,请输入新加员工phone number: " pho
		fi
		}
		
		judgnum $pho		

		read -p "请输入新加员工family name: " fn
		read -p "请输入新加员工given name: " gn
		read -p "请输入新加员工department number: " dn
		read -p "请输入新加员工job title: " jt
		echo "$pho:$fn:$gn:$dn:$jt" >> records
		echo -e "\033[32;40m"====== 员工信息增加成功 ======"\033[0m"
		}
		add
		read -p "是否还要继续输入其他员工记录: yes/no: " select
		case $select in
			"yes")
				add
				;;
			"no")
				exit		
				;;
			"*")
				echo "请输入yes or no"
				;;
		esac
		;;
	"4")
		del() {
			content=`cat records | grep $phone`
                	echo -e "\033[32;40m"====== 要删除的员工信息如下  ======"\033[0m"
                	echo $content
                	echo -e "\033[32;40m"======================================="\033[0m"   
                	read -p "确认要删除吗,yes/no: " choice
                	case $choice in
                        	"yes")
                                	sed -i '/'$phone'/d'  records
                                	;;
                        	"no")
                                	echo "再考虑考虑吧"
                                	;;
                        	"*")
                                	echo "请输入yes or no"
                                	;;
                	esac
		}

		while :
		do
			read -p "请输入删除员工phone number: " phone
			n1=`echo $phone | sed 's/[0-9]//g'`
			if [ -n "$n1" ];then
                		echo "$num is not a number"
                		continue
        		fi

			phonelist=`cat records | awk -F: '{print $1}' > ./numberlist`
			if  grep -qw "$phone" numberlist;then
				del
				exit
			else
				echo "没有该号码,请输入正确的号码"
                        	continue	
			fi	
			done			
		;;
	"exit")
		exit	
esac



done

