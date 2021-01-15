#!/bin/bash

useradd wanglong
echo 123456 | passwd --stdin wanglong
useradd zhangxiao
echo 123456 | passwd --stdin zhangxiao
useradd huangwei
echo 123456 | passwd --stdin huangwei
useradd luojz
echo 123456 | passwd --stdin luojz

