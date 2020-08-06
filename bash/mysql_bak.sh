#!/bin/bash
TIMESTAMP=`date +%Y-%m-%d`
BACKUP="/data/MYSQL_DUMP/"

#innobackupex --defaults-file=/etc/my_3306.cnf  --user=root --password='123456' ${BACKUP}/gamedb/
#curl http://192.168.0.17:29933 -H 'command:notify' -d " hx_GAME MYSQL_slave 异地备份完成"
innobackupex --defaults-file=/etc/my_3306.cnf  --user=root --password='123456' ${BACKUP}/php_c1admin_one_by_one
curl http://192.168.0.17:29933 -H 'command:notify' -d " hx_c1Admin_one_by_one MYSQL_slave 内网备份完成"
#cd ${BACKUP}/php_c1admin_one_by_one/ && zip -r ${TIMESTAMP}.zip ./${TIMESTAMP}_* && find ./ | grep -v *.zip | xargs rm -rf

innobackupex --defaults-file=/etc/my_3308.cnf  --user=root --password='123456' ${BACKUP}/php_dc_log
curl http://192.168.0.17:29933 -H 'command:notify' -d " hx_dc_log_* MYSQL_slave 内网备份完成"
#cd ${BACKUP}/php_dc_log/ && zip -r ${TIMESTAMP}.zip ./${TIMESTAMP}_* && find ./ | grep -v *.zip | xargs rm -rf

#find ${BACKUP}/GAMEBAK -mtime +7 -delete
find ${BACKUP}/php_c1admin_one_by_one  -mtime +0 -type f -name "*" -exec rm -rf {} \;
find ${BACKUP}/php_dc_log -mtime +0 -type f -name "*" -exec rm -rf {} \;
