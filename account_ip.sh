#!/bin/bash

awk '{print $1}' /var/log/httpd/access_log | sort | uniq -c | sort -rn 
