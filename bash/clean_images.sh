#!/bin/bash


im_num=` docker images | wc -l`
ex_num=`docker ps -a |grep Exi |wc -l`

if [ $im_num -gt 30 ];
then 
docker images  | awk '{print $3}'|sort -r| head -n10|xargs docker rmi;
fi
##清理镜像



cln_dk() {
docker ps -a|grep Exited|awk '{print $1}'|xargs docker rm 
}


if [ $ex_num -ne 0 ];then
	cln_dk;
fi 
#清理推出容器
