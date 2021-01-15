#!/bin/bash

echo "列出安装在linux系统上的磁盘驱动器,请输入1"
echo "列出系统中为驱动器列出的所有分区,请输入2"
echo "列出CPU型号名称及其速度（以GHertz为单位）,请输入3"
echo "系统中使用的一级缓存和二级缓存的大小,请输入4"
echo "查看CPU的体系结构（32位或64位，有多少核）,请输入5"


read -p "请输入您的选择: " opt
case $opt in
        "1")
                #fdisk -l | grep dev
		lsblk | grep disk
                ;;
        "2")
                #fdisk -l | grep dev
		lsblk | grep part
                ;;
        "3")
                cpumodelname=`cat /proc/cpuinfo  | grep "model name" | awk -F: '{print $2}'`
                echo "cpu型号名称为$cpumodelname"
                for speed in `cat /proc/cpuinfo  | grep "cpu MHz" | awk -F: '{print $2}'`
                do
                        SPEED=`echo "scale=2;$speed/1024" | bc`
                        echo "cpu速度为$SPEED GHz"
                done
                ;;
        "4")
                firstcache=`lscpu  | grep "L1d" | awk -F： '{print $2}'`
                secondcache=`lscpu  | grep "L2" | awk -F： '{print $2}'`
                echo "一级缓存大小为: $firstcache  二级缓存大小为: $secondcache"
                ;;
        "5")
                BIT=`uname -a | awk '{print $3}' | awk -F_ '{print $2}'`
		#BIT=`lscpu | sed -n '2p'`
                CORES=`cat /proc/cpuinfo | grep "cpu cores" | uniq | awk -F: '{print $2}'`
		#CORES=`lscpu | grep "Core(s) per socket" | awk '{print $4}'`
		echo "cpu为 $BIT 位, 每个cpu含有 $CORES 核"
		;;
esac
