#!/bin/bash


now_day=$(date +%Y-%m-%d)
now_time=$(date +%Y-%m-%d-%H)


game_back_dir=/data/mongo_backup/game/${now_day}
qmd_back_dir=/data/mongo_backup/qmd/${now_day}

#创建备份文件夹
if [ ! -d "${game_back_dir}" ]; then
    mkdir -p  "${game_back_dir}"

elif  [ ! -d "${qmd_back_dir}" ]; then
     mkdir -p  "${qmd_back_dir}"
else
    echo "备份目录已存在"
fi

mongodump --host 127.0.0.1 --port 27017 -o ${game_back_dir}/
mongodump --host 127.0.0.1 --port 27018 -o ${qmd_back_dir}/

cd ${game_back_dir} && zip -r game_${now_time}.zip ./* --exclude "*.zip"
cd ${qmd_back_dir} && zip -r qmd_${now_time}.zip ./* --exclude "*.zip"

find ${game_back_dir} -mtime +5 -type f -name "*.zip" | xargs rm -f
find ${qmd_back_dir} -mtime +5 -type f -name "*.zip" | xargs rm -f
