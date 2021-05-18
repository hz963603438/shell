#!/usr/bin/python3

from urllib.request import urlopen
import json

json_url = 'http://res.wanghl.cn/get-task.json'
response = urlopen(json_url)
req = response.read()
json_dict = json.loads(req)
print(json_dict['taskId'], json_dict['shell'])
