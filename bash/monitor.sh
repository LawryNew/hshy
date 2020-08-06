#!/bin/bash

#磁盘使用率
used=`df -P | grep root | awk '{print $5}' | cut -f 1 -d "%"`

#cpu使用率
cpu=`top -n 1 | awk -F '[ %]+' 'NR==3 {print $9}'`


post_duanxin="/data/scripts/post_duanxin.py"

if [ ${used} -gt 90 ]; 
then
	python ${post_duanxin} 18671956323 "【警告】服务器admin磁盘使用率超过90%。"
fi	


if [ $(echo "${cpu} <= 10"|bc) = 1 ]; 
then
        python ${post_duanxin} 18671956323 "【警告】服务器admin:CPU使用率超过90%。"
fi	
