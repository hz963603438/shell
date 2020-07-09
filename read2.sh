#!/bin/bash

read -n1 -p "dp you want to contnue [y/n]" answer
case $answer in
	Y|y)
	#	echo -e "\n"
		echo -e "\nfine,continue"
		;;
	N|n)
		echo -e "\n"
		echo "ok,goodbye"
		;;
	*)	
		echo -e "\n"
		echo "error choice"
		;;
esac
exit 0
