#!bin/bash

fenqus="/dev/xvde"

for fenqu in $fenqus
do
parted $fenqu <<EOF
mklabel gpt
mkpart
1
ext4
0
300GB
mkpart
2
ext4
300GB
100%
quit
EOF

	sleep 2
	mkfs -t ext4 -i 102400 ${fenqu}1
done


mkdir -p /tctHome

echo '/dev/xvde1 /tctHome ext4 defaults 0 0' >> /etc/fstab

mount -a

