#!/bin/bash

cpu=`grep '^vendor_id' /proc/cpuinfo | head -1 | awk -F ': ' '{print $2}'`
if [ $cpu == "AuthenticAMD" ];then
	echo "cpu厂商是AMD"
elif [ $cpu == "GenuineIntel" ];then
	echo "cpu厂商是Intel"
else
	echo "cpu长沙是非主流厂商"
fi
