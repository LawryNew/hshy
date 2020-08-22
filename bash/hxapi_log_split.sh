#!/bin/bash





nohup cat /data/nginx/logs/hxapi_access_log_pipe | /usr/local/sbin/cronolog /data/nginx/logs/hxapi_access%Y%m%d/%Y%m%d%H%M.log  2>&1 & 



nohup cat /data/nginx/logs/hxapi_error_log_pipe | /usr/local/sbin/cronolog /data/nginx/logs/hxapi_error%Y%m%d/%Y%m%d%H%M.log 2>&1 & 
