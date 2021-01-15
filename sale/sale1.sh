#!/bin/bash

USER=root
PASSWD=123456
DATABASE=test
DIR1=/tmp
DIR2=/home
SQL=test.sql

echo "(1)、备份mysql数据库，请输入1"
echo "(2)、更新数据，请输入2"

read -p "请输入您的选择: " opt

case $opt in
	"1")
		/usr/local/mysql/bin/mysqldump -u$USER -p$PASSWD $DATABASE > $DIR1/$DATABSE.sql
		echo "备份$DATABASE库完成"
		;;
	"2")
		/usr/local/mysql/bin/mysql -u$USER -p$PASSWD < $DIR2/$SQL
		echo "$DIR2下的$SQL导入完成"
		;;
	*)
		echo "请输入1或者2"
		;;
esac
	
