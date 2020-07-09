#/bin/bash

read -t 30 -p "please input your name: " name

echo $name

read -s -t 30 -p  "please input your age: " age
#echo -e "\n"
echo $age

read -n 1 -t 30 -p "[M/F]: " sex
echo -e "\n $sex"
