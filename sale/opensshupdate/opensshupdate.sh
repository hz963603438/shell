#!/bin/bash

DATE=`date +%Y%m%d`

installenv() {
        cd $(cd `dirname $0`;pwd)
        sed -i 's/enforcing/disabled/g'
        setenforce 0
        yum install –y gcc gcc-c++ kernel-devel
        yum -y install pam-devel
        rpm -ivh ./rpmbag/mpfr-3.1.1-4.el7.x86_64.rpm
        rpm -ivh ./rpmbag/libmpc-1.0.1-3.el7.x86_64.rpm
        rpm -ivh ./rpmbag/kernel-headers-3.10.0-123.el7.x86_64.rpm
        rpm -ivh ./rpmbag/glibc-headers-2.17-55.el7.x86_64.rpm
        rpm -ivh ./rpmbag/glibc-devel-2.17-55.el7.x86_64.rpm
        rpm -ivh ./rpmbag/cpp-4.8.2-16.el7.x86_64.rpm
        rpm -ivh ./rpmbag/gcc-4.8.2-16.el7.x86_64.rpm
	echo $?
	echo "==========  变异环境安装完成 =========="
}

opentelnet() {
        chkconfig --list | grep telnet
        chkconfig telnet on
        /etc/init.d/xinetd restart
        netstat -an | grep ":23 "
	echo $?
	echo "========== telnet开启成功 =========="
}

backupfile() {
        cp -p /usr/sbin/sshd /usr/sbin/sshd_bak`date +%Y%m%d`
        cp -p /etc/init.d/sshd /etc/init.d/sshd_bak`date +%Y%m%d`
        cp -p /etc/pam.d/sshd /etc/pam.d/sshd_bak`date +%Y%m%d`
        cd /etc/ssh
        tar -zcvf ssh_conf_bak"$DATE".tar.gz --exclude *.tar --exclude *.tar.gz *
	echo $?
	echo "========== 相关文件备份完成 =========="
}

installzlib() {
        cd $(cd `dirname $0`;pwd)
        tar -zxvf ./tools/zlib-1.2.11.tar.gz
        cd ./tools/zlib-1.2.11
        ./configure --prefix=/usr/local/zlib
        make && make install
	echo $?
	echo "========== zlib安装完成 =========="
}

installopenssl() {
        cd /tmp/ssh-ntp 
        tar -zxvf openssl-1.1.1e.tar.gz 
        cd openssl-1.1.1e 
        ./config --prefix=/usr/local --shared 
        make depend 
        make 
        make test 
        make install 
        mv /usr/bin/openssl /usr/bin/openssl_bak`date +%Y%m%d` 
        mv /usr/include/openssl /usr/include/openssl_bak`date +%Y%m%d` 
        ln -s /usr/local/include/openssl /usr/include/openssl 
        ln -s /usr/local/bin/openssl /usr/bin/openssl 
        ln -s /usr/local/lib64/libssl.so.1.1 /usr/lib64/libssl.so.1.1 
        ln -s /usr/local/lib64/libcrypto.so.1.1 /usr/lib64/libcrypto.so.1.1 
        echo '/usr/local/ssl/lib' >> /etc/ld.so.conf
        ldconfig -v
        ldconfig 
        openssl version
	echo "========== openssl安装完成 =========="
}

installopenssh() {
        cd /openssh_update 
        tar -zxvf openssh-8.3p1.tar.gz 
        cd openssh-8.3p1 
        ./configure --prefix=/usr --sysconfdir=/etc/ssh --with-ssl-dir=/usr/local/lib64 --with-md5- 
        passwords --with-pam --mandir=/usr/share/man --without-openssl-header-check --with
        zlib=/usr/local/zlib 
        make 
        make install
	echo $? 
        mv /etc/init.d/sshd_bak"$DATE" /etc/init.d/sshd 
        mv /etc/pam.d/sshd_bak"$DATE" /etc/pam.d/sshd 
        cat /etc/ssh/sshd_config > ./sshd_config.txt
	echo "=========== openssh安装完成 =========="
}

verify() {
        systemctl restart sshd
        /etc/init.d/sshd restart
        ssh -V
	echo "=========== 验证ok,冒得问题 =========="
}

installenv
#opentelnet
#backupfile
#installzlib
#installopenssl
#installopenssh
#verify

