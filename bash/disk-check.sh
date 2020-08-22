#!/bin/bash
# author by paul 
run_time=`date +%m%d%H`
touch /etc/ansible/result-${run_time}.txt

host_name=("hx_client_log" "hx_zhifu" "hx_api.cdhdb.com" "hx_api.ppj365.com" "hx_wsp.hx5888.com" "hx_api.xijingzs.com" "hx_zhuanxian" "hx_tishenfu" "hx_gameserver" "hx_tiyanfu" "hx_gateway" "hx_gw/nginx" "hx_api" "hx_admin" "hx_qmd" "hx_jobs" "hx_qmddb" "hx_phpdb" "hx_gamedb" "hx_ssd" "hm_zhuanxian" "hm_pay"  "hm_beiyong" "hm_gameserver" "hm_gateway" "hm_qmd" "hm_api" "hm_admin_jobs" "hm_nginx_proxy" "hm_game_master_db" "hm_game_slave_db" "hm_php_master_db" "hm_php_slave_db" "hm_qmddb" "hx_gaofang" "hm_gaofang")

for name in ${host_name[@]}
do
  if [ !$name ];then
    ansible $name  -m raw  -a "df -TH |grep -v "Use%"| awk -F '[ %]+' '{if(\$6>=75) print}'" |  grep  "dev" | awk '{print $6}'  > /etc/ansible/result-${run_time}.txt
    result=`cat /etc/ansible/result-${run_time}.txt`
    if [[ "$result" = "" ]];then
      echo "本次检查$name 磁盘空间正常"
    else 
      curl http://192.168.0.17:29933 -H 'command:notify' -d "$run_time $name 磁盘空间已达$result，请检查处理！！！" 
    fi
else
    echo "----------------------the value is empty--------------------"
  fi
done
 
curl http://192.168.0.17:29933 -H 'command:notify' -d "$run_time  本次磁盘检查已完！！"

rm -f /etc/ansible/result-${run_time}.txt


