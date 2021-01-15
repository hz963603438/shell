#!/bin/bash

fenqus="/dev/xvde"

for fenqu in $fenqus
do
parted $fenqu <<EOF
mklabel gpt
1
mkpart data 0 100G
quit
EOF

sleep 2
mkfs -t ext4 -i 102400 ${fenqu}1
done

mkdir -p /tctHome

e2label /dev/xvde1 /tctHome
echo 'LABEL=data1 /tctHome ext4 defaults 0 0' >> /etc/fstab

mount -a
