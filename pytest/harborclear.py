# more harbor_clear.py
# !/usr/bin/python3

from __future__ import print_function
import time, datetime, pytz
from kubernetes import client
from kubernetes.client.rest import ApiException
from pprint import pprint
import pandas
import os, sys
from datetime import datetime
import requests, json
import ssl
import urllib3

urllib3.disable_warnings()

tag_keepdays = 7
harbor_url = "http://10.0.1.2"
harbor_auth = ('admin', 'Harbor12345')
api_server = "https://10.0.1.100:6443"
api_token = "14ff07.ocx9lq3fps2g0kos"
cert_file = "/root/shell/pytest/.ca.crt"
logfile = "/root/shell/pytest/harbor_clear/harbor_clear.log"


def mylog(str):
    with open(logfile, 'a') as f:
        f.write(str)
        f.write("\n")


# 获取k8s集群中有容器使用的tag list
def get_taglist_inuse():
    configuration = client.Configuration()
    configuration.host = api_server
    configuration.verify_ssl = True
    configuration.debug = False
    configuration.api_key = {"authorization": "Bearer " + api_token}
    configuration.ssl_ca_cert = cert_file
    myclient = client.ApiClient(configuration)

    namespace = 'default'
    pretty = 'true'
    limit = 1000
    timeout_seconds = 100
    watch = 'false'

    v1 = client.AppsV1Api(myclient)
    ret = v1.list_namespaced_deployment(namespace, pretty=pretty, limit=limit, timeout_seconds=timeout_seconds,
                                        watch=watch)

    taglist = []
    for i in ret.items:
        taglist.append(i.spec.template.spec.containers[0].image.replace(harbor_url.split('//')[1] + "/", ''))
    return taglist


# 获取harbor中的tag list
def get_taglist_inharbor():
    ## get project id list

    url = harbor_url + "/api/projects"
    resp = requests.get(url, auth=harbor_auth, verify=False)
    projdetaillist = resp.json()
    projidlist = []
    for i in range(len(projdetaillist)):
        if projdetaillist[i]["name"] != "baseimage":
            projidlist.append(projdetaillist[i]["project_id"])

    ## get repository list

    reponamelist = []
    url = harbor_url + "/api/repositories"
    for projid in projidlist:
        project_id = {'project_id': projid}
        resp = requests.get(url, params=project_id, auth=harbor_auth, verify=False)
        repodetaillist = resp.json()
        for repodetail in repodetaillist:
            reponamelist.append(repodetail["name"])

    ## get tag list

    nowtime = datetime.now()
    taglist = []
    for repo in reponamelist:
        url = harbor_url + "/api/repositories/" + repo + "/tags"
        resp = requests.get(url, auth=harbor_auth, verify=False)
        tagdetaillist = resp.json()
        for tagdetail in tagdetaillist:
            tagdic = {"reponame": repo, "name": tagdetail["name"], "created": tagdetail["created"]}
            taglist.append(tagdic)

    return (taglist)


# 在harbor中删除指定tag
# tag: {'reponame': 'dlmm/dlmm-inf', 'name': 'origin_release_v20190709.1', 'created': '2019-08-21T03:25:00.949639757Z'}
def delete_tag_inharbor(tag):
    tag_url = "/api/repositories/" + tag["reponame"] + "/tags/" + tag["name"]
    url = harbor_url + tag_url
    resp = requests.delete(url, auth=harbor_auth, verify=False)
    if resp.status_code == 200:
        mylog(datetime.now().strftime("%Y-%m-%d %H:%M:%S") + " delete_success " + tag["reponame"] + " " + tag[
            "name"] + " " + tag["created"])
    else:
        mylog(datetime.now().strftime("%Y-%m-%d %H:%M:%S") + " delete_failed " + tag["reponame"] + " " + tag[
            "name"] + " " + tag["created"] + " " + str(resp))


tag_inuse = get_taglist_inuse()
tag_inharbor = get_taglist_inharbor()

df_harbor = pandas.DataFrame(tag_inharbor)
df_harbor_last = df_harbor.groupby(['reponame'])['created'].max().to_dict()

# 获取满足删除条件的tag list
tag_todelete = []
for tag in tag_inharbor:
    # 有容器使用的tag，不删
    if tag["reponame"] + ":" + tag["name"] in tag_inuse:
        continue
    # 各repository中的最新创建的tag，不删
    if tag["created"] == df_harbor_last[tag["reponame"]]:
        continue
    # 创建时间小于指定天数的，不删
    createtime = datetime.strptime(tag["created"].split("T")[0], "%Y-%m-%d")
    if (datetime.now() - createtime).days < tag_keepdays:
        continue
    # 其他情况，删除
    tag_todelete.append(tag)

for tag in tag_todelete:
    delete_tag_inharbor(tag)
