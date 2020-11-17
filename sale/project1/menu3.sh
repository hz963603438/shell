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
		cat records
		;;
	"2")
		while true
		do
			read -p "enter keyword: " keyword
			if [[ $keyword = '' ]]
			then
				echo "keyword not entered"
			else
				break
			fi
		done
		grep -iF $keyword records
		if [[ $? !=0 ]]
		then
			echo "$keyword not found"
		fi
		;;
	"3")
		while true
		do
			echo "add new employee record"
			while true;do
				read -p "phone number (xxxxxxxx): " pn
				if [[ $pn = '' ]];then
					echo "number not entered"
				elif [[ $pn =~ ^[1-9][0-9]{7}$ ]];then
					if grep -qF $pn records;then
						echo "phone number exists"
					else
						break
					fi
				else
					echo "invalid phone number"
				fi
			done
			while ture;do
				read -p "family name: " fn
				if [[ $fn =~ ^([' ']|[a-zA-A])+$ ]];then
					break
				else
					echo "family name can contain only alphabetic characters and spaces"
				fi
			done
			while ture;do
				read -p "given name: " gn
				if [[ $gn =~ ^([' ']|[a-zA-Z])+$ ]];then
					break
				else
					echo "given name can contain only alphabetic characters and spaces"
				fi
			done
			while ture;do
                                read -p "department number: " dn
                                if [[ $dn =~ [0-9][0-9] ]];then
                                        break
                                else
                                        echo "a valid department number contains 2 digits"
                                fi
                        done
			while ture;do
                                read -p "job title: " gt
                                if [[ $gt =~ ^([' ']|[a-zA-Z])+$ ]];then
                                        break
                                else
                                        echo "job title name can contain only alphabetic characters and spaces"
                                fi
                        done
			echo "adding new employee record to the records file"
			echo "$pn:$fn:$gn:$dn:$jt" >> records
			if [[ $? = 0 ]];then
				echo "new records saved"
			fi
			read -p "add another? y or n: " select
			case $select in
			Y | y)
				:;;
			N | n)
				break;;
			*)
				echo "you can only type in y or n";;
			esac
		done
		;;
	"4")
		while true
		do
			echo "delete employee record"
			while ture;do
				read -p "enter a phone number: " pn
				if [[ $pn = '' ]];then
					echo "phone number not entered"
				elif [[ $pn =~ ^[1-9][0-9]{7}$ ]];then
					if grep -F $pn records;then
						break
					else
						echo "phone number not found"
					fi
				else
					echo "invalid phone number"
				fi
			done
			
			read -p "confirm delete: y or n: " choice
			case $choice in
				Y | y)
					sed -i "/$pn/d" records
					if [[ $? = 0 ]];then
						echo "record deleted"
					fi
				;;
			N | n)
				:
				;;
			*)
				echo "you can only type in y or n"
				;;
			esac
		done
		;;
	"exit")
		exit	
esac

echo
read -p "press enter to continue"

done

