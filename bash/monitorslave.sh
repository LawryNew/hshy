#!/bin/bash
user='root'
password='123456'
#Pro=$1

live=`ps -ef|grep -v grep |grep mysqld_safe|wc -l`

if [ $live -eq 3 ];
then
	
	echo "今天没有挂掉" + $(date +%Y-%m-%d-%H-%M-%S) >> /data/scripts/time.log
else

	 curl http://192.168.0.58:29934 -H 'command:notify' -d " hxslavedb已挂掉 请登录检查并启动"
fi

for Pro in {3306..3308}
do

#yes_num=`mysql -u"$user"  -p"$password" -S /tmp/mysql_${Pro}.sock -e 'show slave status \G'| grep -i yes | wc -l`
slave_start=`/usr/local/mysql/bin/mysql -u"$user" -p"$password" -S /tmp/mysql_${Pro}.sock -e 'start slave;'`
slave_time=`/usr/local/mysql/bin/mysql -u"$user" -p"$password" -S /tmp/mysql_${Pro}.sock -e 'show slave status\G'|grep -i Seconds_Behind_Master|awk '{print $2}'`
yes_num=`/usr/local/mysql/bin/mysql -uroot -p123456  -S /tmp/mysql_${Pro}.sock -e "show slave status \G" |grep -i yes| wc -l`


if [ ${Pro} = 3306 ] && [ ${yes_num} -ne 2 ];then
        curl http://192.168.0.58:29934 -H 'command:notify' -d " hx_gamedb MYSQL_slave ${Pro} 主从同步异常,请及时登陆处理 不等于2 的yes_num 的值是 ${yes_num}  $yes_num"
        ${slave_start}
elif [ ${Pro} = 3306 ] && [ $slave_time -gt 500 ]; then
        curl http://192.168.0.58:29934 -H 'command:notify' -d " hx_gamedb MYSQL_slave ${Pro} 主从同步延迟 ${slave_time} 秒"

elif [ ${Pro} = 3307 ] && [ $yes_num -ne 2 ];then
        curl http://192.168.0.58:29934 -H 'command:notify' -d " hx_c1Admin_one_by_one MYSQL_slave ${Pro} 主从同步异常,请及时登陆处理"
        ${slave_start}

elif [ ${Pro} = 3307 ] && [ ${slave_time} -gt 500 ]; then
        curl http://192.168.0.58:29934 -H 'command:notify' -d " hx_c1Admin_one_by_one  MYSQL_slave ${Pro} 主从同步延迟 ${slave_time} 秒"

elif [ ${Pro} = 3308 ] && [ ${yes_num} -ne 2 ];then
        curl http://192.168.0.58:29934 -H 'command:notify' -d " hx_dc_log_* MYSQL_slave ${Pro} 主从同步异常,请及时登陆处理"
        ${slave_start}

elif [ ${Pro} = 3308 ] && [ ${slave_time} -gt 500 ]; then
        curl http://192.168.0.58:29934 -H 'command:notify' -d " hx_dc_log_* MYSQL_slave ${Pro} 主从同步延迟 ${slave_time} 秒"
else
        echo "愿世界和平 同步延迟正常"+$(date +%Y-%m-%d-%H-%M-%S) >> /data/scripts/time.log;
fi
done
