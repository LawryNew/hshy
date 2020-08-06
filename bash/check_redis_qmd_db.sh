#!/bin/bash


num=`ps -ef|grep redis-server |grep -v grep|wc -l`
date=`date +%Y-%m-%d-%H:%M:%S`

if [ $num -lt 1 ];then
  echo "redis-server slave on ssd  is  killed ---- $date "  >> /data/scripts/redis_qmd_restart.log
  sleep 5
  ###杀掉剩余的进程
  # ps -ef|grep redis-server|grep -v grep |awk '{print $2}'|xargs kill -9 >> /dev/null 
  #sh /data/scripts/redis_start.sh

  #if [ $? -eq 0 ];then
   # echo "redis-server slave on ssd  starting ---$date"  >> /data/scripts/redis_qmd_restart.log
  #else
  #  echo "redis-server slave start error~~~"
  echo "please check it  on qmd_db  $date " >> /data/scripts/redis_qmd_restart.log
  curl http://192.168.0.17:29933 -H 'command:notify' -d " please check it on game_db"

 # fi
else
  echo "redis-server on qmd_db  is running  $date  take it easy " >> /data/scripts/redis_qmd_restart.log
fi
