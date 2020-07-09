#/bin/bash


#nginx安装后logs的路径
source_log_path=/usr/local/openresty/nginx/logs
#日志切割后保存的路径
dest_log_path=/usr/local/openresty/nginx/to_progress

yesterday=$(date +%Y%m%d%H%M%S) 

#
mv ${source_log_path}/access.log ${dest_log_path}/${yesterday}.log
#
kill -USR1 `ps axu | grep "nginx: master process" | grep -v grep | awk '{print $2}'`
