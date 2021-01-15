#!/bin/bash

fenqus="/dev/vdb"

for fenqu in $fenqus
do
parted $fenqu <<EOF
mklabel gpt
mkpart data 0% 100%
quit
EOF

sleep 2
mkfs -t ext4 -i 102400 ${fenqu}1
done

mkdir /data1

e2label /dev/vdb1 data1
echo 'LABEL=data1 /data1 ext4 defaults 0 0' >> /etc/fstab

mount -a
