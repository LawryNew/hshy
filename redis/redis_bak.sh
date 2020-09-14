#!/bin/bash

back_dir=/data/redis_backup/
now_day=$(date +%Y-%m-%d)
now_time=$(date +%Y-%m-%d-%H)

backup_dir=${back_dir}/${now_day}
game_redis_dir=/data/game_redis_slave/data/
qmd_redis_dir=/data/qmd_redis_slave/data/

#创建备份文件夹
if [ ! -d "${backup_dir}" ]; then
    mkdir -p  "${backup_dir}"
fi


game_save=`/usr/local/bin/redis-cli -p 6379 -a passwd save`
qmd_save=`/usr/local/bin/redis-cli -p 6380 -a passwd save`

cd ${game_redis_dir} && zip -r ${backup_dir}/game_${now_time}.zip ./dump.rdb
cd ${qmd_redis_dir} && zip -r ${backup_dir}/qmd_${now_time}.zip ./dump.rdb

find ${back_dir} -mtime +1 -type f -name "*" -exec rm -rf {} \;
