#!/usr/bin/env python
#-*-coding:utf-8 -*-
#Date  : 20200427
#Author: jess.xiao
#Desc  : Obtain monitoring data

import sys
import os
import datetime
import Message
import yaml

def mkdir(dirs):
    if not os.path.exists(dirs):
       os.makedirs(dirs)

def remove(files):
    if os.path.exists(files):
       os.remove(files)

def readYml(file,encoding='UTF-8'):
    with open(file)as fd:
        res = yaml.load(fd)
    return res

def main():
    try:
#       if Maximum >= 90:
          mkdir(dirs_token)
          os.system(shell_sql)
          os.system(shell)
          for addressee in addressees:
              wx = Message.WeChat(addressee)
              wx.send_file(Text, File)
          #remove(File)
    except Exception, e:
       for addressee in addressees:
           wx = Message.WeChat(addressee)
           Fail_text = '%s 获取失败'%Text
           wx.send_data(Fail_text)


if __name__ == '__main__':
    addressees = {
         'frank.fu@kilimall.com',
         'jadiy.peng@kilimall.com',
         'hymn.song@kilimall.com',
         'rahal.hu@kilimall.com'
    }
    dirs          = os.path.dirname(os.path.abspath(__file__))
    os.chdir(dirs)
    dirs_token    = "./token"
    config        = readYml('../.config.yaml')
    systems       = {'lipapay','kilimall'}
    query_time    = 3
#    shell_aws_str = "aws cloudwatch get-metric-statistics --namespace AWS/RDS --metric-name CPUUtilization --statistics Maximum --start-time {before_s} --end-time {now_s} --period 3600"
#    now_s = now.strftime("%Y-%m-%dT%H:%M:%S")
#    before_s = before.strftime("%Y-%m-%dT%H:%M:%S")

    shell_str = "gzip ./{system}_slow_SQL{now_S}.log"
    shell_sql_str = """mysql -h{host} -u{user} -p{password} -P{port} -D{database} -s -r -e "SELECT CONCAT( '# Time: ', DATE_FORMAT(start_time, '%y-%m-%d %H:%i:%s'), '\n', '# User@Host: ', user_host, '\n', '# Query_time: ', TIME_TO_SEC(query_time),  '  Lock_time: ', TIME_TO_SEC(lock_time), '  Rows_sent: ', rows_sent, '  Rows_examined: ', rows_examined, '\n', sql_text, ';' ) FROM mysql.slow_log where DATE_FORMAT(start_time, '%Y%m%d %H:%i:%s') between '{before_d} 00:00:00' and '{now_d} 00:00:00' and query_time >={query_time}" > ./{system}_slow_SQL{now_S}.log"""
    for system in systems:
        database  = config[system]['Monitor']['database']
        user      = config[system]['Monitor']['user']
        host      = config[system]['Monitor']['host']
        password  = config[system]['Monitor']['password']
        port      = config[system]['Monitor']['port']
        
        Text      = '%s  慢查询SQL' %system
        #shell_aws = shell_aws_str.format(before_s=before_s,now_s=now_s)
        #monitor_data = os.popen(shell_aws).read()
        #monitor_data = eval(monitor_data)
        #Maximum = monitor_data["Datapoints"][0]["Maximum"]

        now  = datetime.datetime.now()
        now_S = now.strftime("%Y-%m-%dT%H_%M_%S")
        now_d = now.strftime("%Y%m%d")
        before = now - datetime.timedelta(hours=24)
        before_d = before.strftime("%Y%m%d")

        shell_sql = shell_sql_str.format(host=host,user=user,password=password,port=port,database=database,before_d=before_d,now_d=now_d,query_time=query_time,system=system,now_S=now_S)
        shell     = shell_str.format(system=system,now_S=now_S)
        File = "./{system}_slow_SQL{now_S}.log.gz".format(system=system,now_S=now_S)
        main()

