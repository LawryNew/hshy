#!/bin/bash
TIMESTAMP=`date +%Y-%m-%d`
BACKUP="/data/MYSQL_DUMP/"

innobackupex --defaults-file=/etc/my_3306.cnf  --user=root --password='123456' ${BACKUP}/gamedb/
curl http://175.41.29.186:29933 -H 'command:notify' -d " hx_GAME MYSQL_slave 异地备份完成"
#zip -r ${BACKUP}/gamedb/${TIMESTAMP}.zip ${BACKUP}/gamedb/${TIMESTAMP}_*  
#rm -rf ${BACKUP}/gamedb/${TIMESTAMP}_


innobackupex --defaults-file=/etc/my_3307.cnf  --user=root --password='123456' ${BACKUP}/php_c1admin_one_by_one
curl http://175.41.29.186:29933 -H 'command:notify' -d " hx_c1Admin_one_by_one MYSQL_slave 异地备份完成"
#zip -r ${BACKUP}/php_c1admn_one_by_one/${TIMESTAMP}.zip ${BACKUP}/php_c1admn_one_by_one/${TIMESTAMP}_*  
#rm -rf ${BACKUP}/php_c1admn_one_by_one/${TIMESTAMP}_


innobackupex --defaults-file=/etc/my_3308.cnf  --user=root --password='123456' ${BACKUP}/php_dc_log
curl http://175.41.29.186:29933 -H 'command:notify' -d " hx_dc_log_* MYSQL_slave 异地备份完成"
#zip -r ${BACKUP}/php_dc_log/${TIMESTAMP}.zip ${BACKUP}/php_dc_log/${TIMESTAMP}_*
#rm -rf ${BACKUP}/php_dc_log/${TIMESTAMP}_


find ${BACKUP}/gamedb  -mtime +1 -type f -name "*" -exec rm -rf {} \;
find ${BACKUP}/php_c1admin_one_by_one  -mtime +1 -type f -name "*" -exec rm -rf {} \;
find ${BACKUP}/php_dc_log  -mtime +1 -type f -name "*" -exec rm -rf {} \;
