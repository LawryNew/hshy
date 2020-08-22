#!/bin/bash
host_name=("hx_client_log")
for name in ${host_name[@]}
do 
  if [ !$name ];then
  ansible hx_client_log -m raw  -a "free -m | awk -F '[ :]+' 'NR==2{print \$2}'" | grep  -v "CHANGED" | grep -v "closed" > /etc/ansible/test.txt
  mem_total=`cat /etc/ansible/test.txt`
  ansible hx_client_log -m raw  -a "free -m | awk -F '[ :]+' 'NR==2{print \$4}'" | grep  -v "CHANGED" | grep -v "closed" > /etc/ansible/test.txt
  mem_free=`cat /etc/ansible/test.txt`
  mem_free_persent=`awk 'BEGIN{printf "%.0f\n",('$mem_free'/'$mem_total')*100}'`
  echo ${mem_free_persent}
    if [[ "${mem_free_persent}" > "80" ]]; then
	echo 3 > /proc/sys/vm/drop_caches
      curl http://192.168.0.17:29933 -H 'command:notify' -d "$run_time $name 磁盘空间已达$result，请检查处理！！！"
    else 
      echo "内存状态良好"
   fi 
else 
  echo "----------------------the value is empty--------------------"
fi
done 

