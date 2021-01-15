#!/bin/bash

IMAGES=/soft/nginx.tar


func_install_doc() {
	echo "开始离线安装docker"

	if [ `whoami` = "root" ];then
    		date
	else  
    		echo "Superuser privileges are required to run this script."
    		echo "e.g. \"sudo sh $0\""
    		exit 1
	fi
	dpkg -i *.deb
	sleep 1
	systemctl daemon-reload
	systemctl restart docker
	docker -v
	docker images

	echo "离线安装docker完成"	
}

func_import_ima() {
	echo "开始导入镜像"
	sudo docker load < $IMAGES > /usr/local/log/2.log
	echo "导入镜像完成"
}

func_run_mariadb() {
	echo "开始运行mariadb"
	docker run --name mariadb -d --restart=always    --privileged   -p 3380:3306   -e MYSQL_ROOT_PASSWORD='1234'  -e TERM=linux    -v /etc/localtime:/etc/localtime   -v ~/lvpin/mariadb/conf.d/:/etc/mysql/conf.d/ -v ~/lvpin/mariadb/data:/var/lib/mysql  -v ~/lvpin/mariadb/log:/var/log/mysql mariadb:latesti > /usr/local/log/3.log
	echo "运行mariadb完成"
}

func_docrunmysql() {
	echo "开始使用docker执行mysql命令导入speed数据库脚本"
	sudo docker exec -i mariadb mysql -uroot -p1234 < ~/lvpin/sql/speed.sql > /usr/lcoal/log/4.log
	echo "导入完成"
}

func_run_dockers() {
	echo "开始分别运行nginx、redis、speed-eureka、speed-dfs、speed-front四个容器"
	docker run  --net=host   -d  --restart=always  --privileged  --log-driver="syslog"    --name  nginx   -v ~/lvpin/nginx/logs/:/var/log/nginx/ -v ~/lvpin/nginx/html/:/usr/share/nginx/html/  -v  ~/lvpin/nginx/:/etc/nginx/   nginx:latesti > /usr/local/log/5.log
	
	docker run -d --name=redis  --publish 6379:6379   --restart=always --log-driver="syslog"  --privileged    -v ~/lvpin/redis/data/:/data/  -v ~/lvpin/redis/redis.conf:/usr/local/etc/redis/redis.conf  redis:latest  redis-server --appendonly yes > /usr/local/log/5.log

	docker run --name speed-eureka --net=host -p 4005:4005 --log-driver="syslog" -d --restart=always --privileged -v /www/lvpin_data/docker/app/speed-eureka/:/app -v /etc/hosts:/etc/hosts genius/sptingboot-runner-genius > /usr/local/log/5.log

	docker run --name speed-dfs --net=host -p 3888:3888 --log-driver="syslog" -d --restart=always --privileged -v /www/lvpin_data/docker/a
pp/speed-dfs/:/app -v /etc/hosts:/etc/hosts genius/sptingboot-runner-genius > /usr/local/log/5.log

	docker run --name speed-mvp-front --net=host -p 3999:3999 --log-driver="syslog" -d --restart=always --privileged -v /www/lvpin_data/docker/app/speed-mvp-front/:/app -v /etc/hosts:/etc/hosts genius/sptingboot-runner-genius > /usr/local/log/5.log
	
	echo "运行完成"
}


if [ $# -eq 0 ];then
	echo "脚本使用方法，必须带一个begin参数，比如:sh sale.sh begin"
elif [ $1 == "begin" ];then
	#func_install_doc
	#func_import_ima
	#func_run_mariadb
	#func_docrunmysql
	#func_run_dockers
	echo 666
else
	echo "脚本使用方法，只能跟一个begin参数，比如:sh sale.sh begin"
fi


