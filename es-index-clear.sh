#!/bin/bash
#只保留一周内的日志索引
last_data=`date -d "-7 days" "+%Y.%m.%d"`

#删除所有的索引
curl -XDELETE http://www.baidu.com/*-${last_date}
