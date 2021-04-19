#!/bin/bash


HOST=10.0.1.110              #数据库所在服务器地址
DBUSER=root                  #数据库用户  
DBPASSWD=123456              #数据库密码
PORT=3316                    #数据库端口
DATABASE=logistics_dms       #需要查询的数据库名称
PWD=$(cd `dirname $0`;pwd)   #脚本所在路径
DAY=`date +%Y%m%d`


#mysql -h$HOST -u$DBUSER -P$PORT -p$DBPASSWD -e"use $DATABASE;select * from sequence;" >> /root/soft/test.txt
#查询生成的txt文件在脚本所在的文件夹
mysql -h$HOST -u$DBUSER -P$PORT -p$DBPASSWD << EOF 2> /dev/null > $PWD/$DAY-data.txt
use $DATABASE;
select * from sequence;
select * from t_handle;
EOF

