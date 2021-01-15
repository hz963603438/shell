#!/bin/bash

echo "请输入1, 查看虚拟内存大小"
echo "请输入2, 查看Residence Memory size"
echo "请输入3, 查看共享内存大小"
echo "请输入4, 查看处于睡眠状态、运行、停止和僵尸的进程数"
echo "请输入5, 查看运行用户进程的CPU百分比"
echo "请输入6, 查看处理器处于空闲状态的百分比"
echo "请输入7, 查看内核进程的CPU运行百分比"
echo "请输入8, 查看CPU运行经过优化的用户空间进程所花费的时间"
echo "请输入9, 查看CPU等待I/O操作的时间"
echo "请输入10, 查看CPU维护软件中断所花费的时间"
echo "请输入11, 查看CPU维护硬件中断所花费的时间"


read  -p "请输入您的选择: " opt
case $opt in
	"1")
		VIRSIZE=`free -m | grep Swap | awk '{print $2}'`
		echo "虚拟内存大小为: $VIRSIZE M"
		;;
	"2")
		RESSIZE=`free -m | grep Mem | awk '{print $2}'`
		echo "Residence Memory size is $RESSIZE M"
		;;
	"3")
		sharesize=`cat /proc/sys/kernel/shmmax`
		SHARESIZE=`echo "scale=2;$sharesize/1024/1024" | bc`
		echo "共享内存大小为: $SHARESIZE M"
		;;
	"4")
		sleeppro=`top -n 1 | grep Tasks | awk '{print $6}'`
		runpro=`top -n 1 | grep Tasks | awk '{print $4}'`
		stoppro=`top -n 1 | grep Tasks | awk '{print $8}'`
		zompro=`top -n 1 | grep Tasks | awk '{print $10}'`
		echo "处于睡眠状态进程数为: $sleeppro"
		echo "处于运行状态进程数为: $runpro"
		echo "处于停止状态进程数为: $stoppro"
		echo "处于僵尸状态进程数为: $zompro"
		;;
	"5")
		userper=`top -n 1 | grep Cpu | awk '{print $2}'`
		echo "用户进程的cpu百分比为: $userper"
		;;
	"6")
		idlepro=`top -n 1 | grep Cpu | awk '{print $8}'`
		echo "处理器处于空闲状态的百分比为: $idlepro"
		;;
	"7")
		syspro=`top -n 1 | grep Cpu | awk '{print $4}'`
		echo "内核进程的CPU运行百分比为: $syspro"
		;;
	"8")
		nipro=`top -n 1 | grep Cpu | awk '{print $6}'`
		echo "time the CPU spent running user space processes that have been niced is : $nipro"
		;;
	"9")
		waitpro=`top -n 1 | grep Cpu | awk '{print $10}'`
		echo "CPU等待I/O操作的时间为: $waitpro"
		;;
	"10")
		softpro=`top -n 1 | grep Cpu | awk '{print $14}'`
		echo "The time spent by CPU servicing software interrupts is : $softpro"
		;;
	"11")
		hardpro=`top -n 1 | grep Cpu | awk '{print $12}'`
		echo "The time spent by CPU servicing hardware interrupts is : $hardpro"
		;;		
esac
