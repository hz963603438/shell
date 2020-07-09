#!/bin/bash

cpu() {
	local user system idle cwait
	user=`vmstat | awk 'NR==3{print $13}'`
	system=`vmstat | awk 'NR==3{print $14}'`
	idle=`vmstat | awk 'NR==3{print $15}'`
	cwait=`vmstat | awk 'NR==3{print $16}'`
	echo "cpu用户占用:" $user%
	echo "cpu系统占用:" $system%
	echo "cpu空闲:" $idle%
	echo "cpu等待磁盘I/O相应占用:" $cwait%
}

memory() {
	local total used free
	used=`free -m |awk 'NR==2{print $3}'` 
	free=`free -m |awk 'NR==2{print $4}'`
	total=$(($used+$free))
	echo "内存总共:" $total M
	echo "内存使用:" $used M
	echo "内存剩余:" $free M
}

disk() {
	#local mount total user_parent free
	part=`df -h | awk 'BEGIN{OFS="="}/^\/dev/{print $6,$2,$3,$4,int($5)}'`
	for i in $part; do
		mount=`echo $i |cut -d "=" -f 1`
		total=`echo $i |cut -d "=" -f 2`
		used=`echo $i |cut -d "=" -f 3`
		free=`echo $i |cut -d "=" -f 4`
		user_parent=`echo $i |cut -d "=" -f 5`
		echo $mount $total $used $free $user_parent
		if [ $user_parent -ge 25 ]; then
			echo "挂载点:" $mount
			echo "分区总大小:" $total
			echo "使用:" $used
			echo "剩余:" $free
		fi
	done 
}

traffic() {
	echo -e "in ------ out"
	local old_in old_out new_in new_out
	old_in=`ifconfig ens33| awk '/RX/&&/bytes/{print $3}'`
	old_out=`ifconfig ens33| awk '/TX/&&/bytes/{print $3}'`
	sleep 1
	new_in=`ifconfig ens33| awk '/RX/&&/bytes/{print $3}'`
	new_out=`ifconfig ens33| awk '/TX/&&/bytes/{print $3}'`
	in=$(($new_in-$old_in))
	out=$(($new_out-$old_out))
	echo "$in kb/s  $out  kb/s" 
}
traffic
