#!/bin/bash
user='root'
password='HaiMa790'
Pro=$1
slave_status=`/usr/bin/mysql -u"$user" -p"$password" -S /tmp/mysql_${Pro}.sock -e 'show slave status\G'|grep -i yes|wc -l`
slave_start=`/usr/bin/mysql -u"$user" -p"$password" -S /tmp/mysql_${Pro}.sock -e 'start slave;'`
slave_time=`/usr/bin/mysql -u"$user" -p"$password" -S /tmp/mysql_${Pro}.sock -e 'show slave status\G'|grep -i Seconds_Behind_Master|awk '{print $2}'`
if [[ "${Pro} = 3306" ]] && [[ "${slave_status}" -ne 2 ]];then


        curl http://175.41.29.186:29933 -H 'command:notify' -d " hm_gamedb MYSQL_slave ${Pro} 异地主从同步异常,请及时登陆处理"
        ${slave_start}
elif [[ "${Pro} = 3306" ]] && [[ "${slave_time}" -gt 500 ]]; then
        curl http://175.41.29.186:29933 -H 'command:notify' -d " hm_gamedb MYSQL_salve ${Pro} 异地主从同步延迟 ${slave_time} 秒"

elif [[ "${Pro} = 3307" ]] && [[ "${slave_status}" -ne 2 ]];then
        curl http://175.41.29.186:29933 -H 'command:notify' -d " hm_php_db MYSQL_slave ${Pro} 异地主从同步异常,请及时登陆处理"
        ${slave_start}

elif [[ "${Pro} = 3307" ]] && [[ "${slave_time}" -gt 500 ]]; then
        curl http://175.41.29.186:29933 -H 'command:notify' -d " hm_php_db  MYSQL_salve ${Pro} 异地主从同步延迟 ${slave_time} 秒"

#elif [[ "${Pro} = 3308" ]] && [[ "${slave_status}" -ne 2 ]];then
#        curl http://175.41.29.186:29933 -H 'command:notify' -d " hx_dc_log_* MYSQL_slave ${Pro} 异地主从同步异常,请及时登陆处理"
#        ${slave_start}

#elif [[ "${Pro} = 3308" ]] && [[ "${slave_time}" -gt 500 ]]; then
#        curl http://175.41.29.186:29933 -H 'command:notify' -d " hx_dc_log_* MYSQL_salve ${Pro} 异地主从同步延迟 ${slave_time} 秒"
else
        echo "愿世界和平"
fi
