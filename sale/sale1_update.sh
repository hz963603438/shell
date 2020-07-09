#!/bin/bash

USER=root
PASSWD=1234
DATABASE=speed
DIR1=~/docker/mariadb
DIR2=~/docker/mariadb
SQL=update.sql

backup()
{
   sudo docker exec -i mariadb mysqldump -u$USER -p$PASSWD $DATABASE > $DIR1/$DATABASE.sql
   echo "备份$DATABASE库完成"
}

import()
{
   sudo docker exec -i mariadb mysql -u$USER -p$PASSWD < $DIR2/$SQL
   echo "$DIR2下的$SQL导入完成"
}

update_cache()
{
   echo "更新缓存完成"
}

update_php_file()
{
   echo "更新PHP文件完成";
}

update_fastdfs()
{
   echo "更新文件完成";
}

update()
{
   backup
   import
   update_cache
   update_php_file
   update_fastdfs
}

echo "(1)、备份mysql数据库，请输入1"
echo "(2)、更新数据，请输入2"
echo "(3)、更新缓存，请输入3"
echo "(4)、更新PHP文件，请输入4"
echo "(5)、更新文件，请输入5"
echo "(6)、应用升级，请输入6"

while :
do
read -p "请输入您的选择: " opt

case $opt in
	"1")
                backup
                ;;
	"2")
		import
                ;;
        "3")
                update_cache
                ;;
        "4")
                update_php_file
                ;;
        "5")
                update_fastdfs
                ;;
        "6")    
                update_fastdfs
                ;;
	*)
		echo "请选择正确的操作项"
		;;
esac
done
