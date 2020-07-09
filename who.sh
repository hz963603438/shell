#/bin/bash


read -p "please input you want see user: " user

login_total=`w|grep $user|awk '{print $1,$2,$3}'`
login_in=`w|grep $user &>/dev/null; echo $?`

echo $login_total
echo "======================"
echo $login_in

if [ $login_in -eq 0 ]; then
	echo $login_total | xargs -n3
else
	echo "no user login"
fi
