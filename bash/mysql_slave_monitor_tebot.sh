#!/bin/bash
user='root'
password='123456'
Pro=$1
slave_status=`/usr/bin/mysql -u"$user" -p"$password" -S /tmp/mysql_${Pro}.sock -e 'show slave status\G'|grep -i yes|wc -l`
slave_start=`/usr/bin/mysql -u"$user" -p"$password" -S /tmp/mysql_${Pro}.sock -e 'start slave;'`
slave_time=`/usr/bin/mysql -u"$user" -p"$password" -S /tmp/mysql_${Pro}.sock -e 'show slave status\G'|grep -i Seconds_Behind_Master|awk '{print $2}'`
if [[ "${Pro} = 3306" ]] && [[ "${slave_status}" -ne 2 ]];then


        curl http://192.168.0.17:29933 -H 'command:notify' -d " hx_c1Admin_one_by_one MYSQL_slave ${Pro} 内网主从同步异常,请及时登陆处理"
        ${slave_start}
elif [[ "${Pro} = 3306" ]] && [[ "${slave_time}" -gt 300 ]]; then
        curl http://192.168.0.17:29933 -H 'command:notify' -d " hx_c1Admin_one_by_one MYSQL_salve ${Pro} 内网主从同步延迟 ${slave_time} 秒"

elif [[ "${Pro} = 3308" ]] && [[ "${slave_status}" -ne 2 ]];then
        curl http://192.168.0.17:29933 -H 'command:notify' -d " hx_dc_log_* MYSQL_slave ${Pro} 内网主从同步异常,请及时登陆处理"
        ${slave_start}
elif [[ "${Pro} = 3308" ]] && [[ "${slave_time}" -gt 300 ]]; then
        curl http://192.168.0.17:29933 -H 'command:notify' -d " hx_dc_log_* MYSQL_salve ${Pro} 内网主从同步延迟 ${slave_time} 秒"
else
        echo "愿世界和平"
fi
