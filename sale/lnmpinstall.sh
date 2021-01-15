#!/bin/bash


nginxinstall() {
        yum -y install openssl openssl-devel pcre pcre-devel zlib-devel
        useradd  -s  /sbin/nologin  -M nginx
        tar -zxf /root/soft/nginx-1.8.0.tar.gz -C /root/soft
        cd /root/soft/nginx-1.8.0
        ./configure  --user=nginx  --group=nginx  --prefix=/usr/local/nginx  --with-http_stub_status_module  --with-http_ssl_module
        make && make install
        /usr/local/nginx/sbin/nginx
}

nginxinstall

mysqlinstall() {
        yum -y install libaio-devel.x86_64
        tar -zxf /root/soft/mysql-5.7.18-install.tar.gz
        tar -zxf /root/soft/mysql-5.7.18-linux-glibc2.5-x86_64.tar.gz
        mv /root/soft/mysql-5.7.18-linux-glibc2.5-x86_64 /usr/local/mysql
        groupadd mysql
        useradd -r -g mysql -s /bin/false mysql
        mkdir -pv /r2/mysqldata
        chmod 750 /r2/mysqldata
        cd /usr/local/mysql
        chown -R mysql:mysql .
        cp -rf /root/soft/template_install-my.cnf /etc/my.cnf
        /usr/local/mysql/bin/mysqld --initialize-insecure --user=mysql --datadir=/r2/mysqldata/
        cp support-files/mysql.server /etc/init.d/mysql
        /etc/init.d/mysql start
}

mysqlinstall

phpinstall() {
        yum -y install libxml2* curl* libjpeg* libpng*  freetype-devel   libcurl-devel
        useradd php-fpm
        cd /root/soft
        xz -d php-5.6.31.tar.xz
        tar -xvf php-5.6.31.tar
        cd php-5.6.31
        ./configure --prefix=/usr/local/php --with-config-file-path=/usr/local/php/etc --enable-fpm --with-fpm-user=php-fpm --with-fpm-group=php-fpm --with-mysql=mysqlnd --with-mysql-sock=/tmp/mysql.sock --with-libxml-dir --with-gd --with-jpeg-dir --with-png-dir --with-freetype-dir --with-iconv-dir --with-zlib-dir --with-mcrypt --enable-soap --enable-gd-native-ttf --enable-ftp --enable-mbstring --enable-exif --disable-ipv6 --with-pear --with-curl --with-openssl --enable-bcmath --enable-sockets --with-mysqli --with-gettext
        echo $?
        if [ $? -eq 0 ];then
                make && make install
        else
                break
        fi
        cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf
        cp /root/soft/php-5.6.31/sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm
        chmod 777 /etc/init.d/php-fpm
        /etc/init.d/php-fpm start
}

phpinstall

