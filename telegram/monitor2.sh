#!/bin/bash

svrName=`ansible all -m shell -a "uptime" |grep CHANGED|awk '{print $1}'`

for name in $svrName;
do
	load=`ansible  $name  -m shell -a "uptime"|awk '{print $11}'|cut -d. -f1`
	disk=`ansible  $name  -m shell -a "df -lh"|grep "/dev/nv" |awk '{print $5}'|cut -d % -f1`
	for dk in $disk; do
	[ $dk -gt 60 ] && curl http://192.168.0.58:29934 -H 'command:notify' -d "$name: 磁盘占用 $dk 大于60，请检查！！！";
	done
	[ $load -gt 5 ] && curl http://192.168.0.58:29934 -H 'command:notify' -d "$name: 系统负载 $load 大于5，请检查！！！！";
done
