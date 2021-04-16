#!/bin/bash

dbs="ApolloConfigDB ApolloPortalDB activemq adaptor au contract hub jumpserver mysql performance_schema qingshan risk risk_client seafile semaphore stargaze sys tianxun xxljob"
selectsql1="mysql -P13306 -udump -p123zrt"
selectsql2="mysql -h10.10.106.221 -P13306 -uroot -pQAZwsx123456"


#for i in `$selectsql1 -Ne"show databases;" 2>/dev/null`
for i in $dbs
do
         for n in `$selectsql1 -Ne"use $i;show tables;" 2>/dev/null`
         do
                for m in `$selectsql1 -Ne"use $i;select count(*) from $n" 2>/dev/null`
                do
                        echo "$n的count数为: $m" >> /sh/mysql1.txt
                done
         done
done

#for i in `$selectsql2 -Ne"show databases;" 2>/dev/null`

for i in $dbs
do
         for n in `$selectsql2 -Ne"use $i;show tables;" 2>/dev/null`
         do
                for m in `$selectsql2 -Ne"use $i;select count(*) from $n" 2>/dev/null`
                do
                        echo "$n的count数为: $m" >> /sh/mysql2.txt
                done
         done
done

vimdiff mysql1.txt mysql2.txt
