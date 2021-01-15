#!/bin/bash

echo 'you wangt to beijing,please choice "1"'
echo 'you wangt to shenzhen,please choice "2"'
echo 'you wangt to changsha,please choice "3"'

#while true
#do
read -t 30 -p "please input your choice: " cho

case "$cho" in
	"1")
		echo "beijing is sale";
		;;
	"2")
		echo "shenzhen is sale";
		;;
	"3")
		echo "shangsha is sale"
		;;
	  *)
		echo "error 1/2/3"
		;;
esac

#done

#case $choice in
#	"1")
#		echo 'beijing is sale'
#		;;
#	"2")
#		echo 'shenzhen is sale'
#afasf
#		;;
#	"3")
#		echo 'shanghai is sale'
#		;;
#	*)
#		echo 'error'
#		;;
#esac
