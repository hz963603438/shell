#!/bin/bash

cd $(cd `dirname $0`;pwd)

if [ ! -f "records" ];then
	echo "records 文件不存在"
	exit
fi

delete() {
	content=`cat records | grep $phone`
	echo -e "\033[32;40m"====== 要删除的员工信息如下所示  ======"\033[0m"
 	echo $content
        echo -e "\033[32;40m"======================================="\033[0m"   
        read -p "确认要删除吗,yes/no: " choice
        case $choice in
        	"yes")
        		sed -i '/'$phone'/d'  records
                	;;
                "no")
                        echo "停止删除"
                        ;;
                "*")
                        echo "请输入yes or no"
                        ;;
	esac
}


while :
do

echo "查询所有当前员工记录,请输入1"
echo "查询制定当前员工记录,请输入2"
echo "增加新员工记录,请输入3"
echo "删除员工记录,请输入4"
echo "退出当前脚本,请输入exit"

read -p "请输入您的选择: " cho
case $cho in
	"1")
		echo -e "\033[31;40m"======================================="\033[0m"
		cat records
		echo -e "\033[31;40m"======================================="\033[0m"
		;;
	"2")
		read -p "请输入要查询的员工电话号码: " number
		echo -e "\033[32;40m"======================================="\033[0m"
		cat records | grep $number
		echo -e "\033[32;40m"======================================="\033[0m"
		;;
	"3")
		addpeople() {
			read -p "请输入新加员工phone number: " phonum
			read -p "请输入新加员工family name: " fname
                	read -p "请输入新加员工given name: " gnanme
                	read -p "请输入新加员工department number: " dnum
                	read -p "请输入新加员工job title: " jtitle
			echo "$phonum:$fname:$gname:$dnum:$jtitle" >> records
                	echo -e "\033[31;40m"====== 新员工信息记录增加成功 ======"\033[0m"
		}
		
		read -p "是否还要继续输入其他员工记录: yes/no: " select
		case $select in
			"yes")
				addpeople
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
		while :
		do
			read -p "请输入删除员工phone number: " phone
			n1=`echo $phone | sed 's/[0-9]//g'`
			if [ -n "$n1" ];then
                		echo "$phone is not a number"
                		continue
        		fi

			phonelist=`cat records | awk -F: '{print $1}' > ./numberlist`
			if  grep -qw "$phone" numberlist;then
				delete
				exit
			else
				echo "没有该号码,请输入正确的号码"
                        	continue	
			fi	
			done			
		;;
	"exit")
		exit
		;;
	*)
		echo -e "\033[31;40m"====== 请输入正确的选项  ======"\033[0m"
		;;
esac

done

