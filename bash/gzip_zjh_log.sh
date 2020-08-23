#!/bin/bash

DT=`date +"%Y-%m-%d" -d "3 days ago"`  
dir_log="/data/logs"
gzip_dir_log="/data/gzip_logs"

cd ${dir_log} &&   zip -r ${DT}.zip  ${DT}*/  && mv ${dir_log}/${DT}.zip  ${gzip_dir_log}
if [ $? == 0 ];then
echo "zip have moved" 
echo ${DT} >> ${gzip_dir_log}/zip.txt
fi

[ -f ${gzip_dir_log}/${DT}.zip ] &&  echo "zip is exist" 
find ${dir_log}/ -name "${DT}*" -exec rm -fr {} \; >> /dev/null&  
#&& echo "the moved ${DT}dic have been deled" >> ${gzip_dir_log}/zip.txt
