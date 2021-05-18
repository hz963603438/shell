#!/bin/bash

function get_parameter
{
    taskId=${1}
    shfile_url=${2}
}


get_parameter $(./get_parameter.py)


while true
do
    wget ${shfile_url}
    #执行下载的sh，并把sh的输出curl上传
    SCRIPTS=`ls -lt | tail -1 | awk '{print $9}'`
    sh $SCRIPTS > ./outputfile
    curl -T ./outputfile http://res.wanghl.cn/put-task-output?taskId=$taskId 
    sleep 2
done
