#!/bin/bash

disktotal="/dev/sda1 /dev/sdb1 /dev/sdc1"
diskaccount="3"

buildraid() {
	sudo apt-get update
	sudo apt-get install mdadm
	sudo mdadm --create /dev/md0 --chunk=128 --level=0 --raid-devices=$diskaccount $disktotal
	sudo mkfs.ext4 /dev/md0
	uuid1=`blkid | grep sda1 | awk '{print $2}'`
	echo "ARRY /dev/md0 level=raid0 num-devices=2 $uuid" >> /etc/mdadm/mdadm.conf
	uuid2=`blkid | grep md0 | awk '{print $2}'`
	mkdir -p /data1
	echo "$uuid2 /data1 ext4 defaults 0 2" >> /etc/fstab
}

buildraid
