#!/bin/bash
TIMESTAMP=`date +%Y-%m-%d`
BACKUP="/data/MYSQL_DUMP"

innobackupex --defaults-file=/etc/my_3307.cnf  --user="root" --password='123456' ${BACKUP}/gamedb
cd $(BACKUP)/gamedb &&  zip -r   ./`date +%Y-%m-%d`.zip  ./`date +%Y-%m-%d`*/*   && find ./  -name `date +%Y-%m-%d`_*  -type d  -exec rm -rf {} \;

#curl http://175.41.29.186:29933 -H 'command:notify' -d " hm_GAME MYSQL_slave 异地备份完成"
#zip -r ${BACKUP}/gamedb/${TIMESTAMP}.zip ${BACKUP}/gamedb/${TIMESTAMP}_* 
#rm -rf ${BACKUP}/gamedb/${TIMESTAMP}_
innobackupex --defaults-file=/etc/my_3306.cnf  --user=root --password='123456' ${BACKUP}/phpadmin
cd $(BACKUP)/phpadmin &&  zip -r   ./`date +%Y-%m-%d`.zip  ./`date +%Y-%m-%d`*/*   && find ./  -name `date +%Y-%m-%d`_*  -type d  -exec rm -rf {} \;

#curl http://175.41.29.186:29933 -H 'command:notify' -d " hm_c1Admin_one_by_one MYSQL_slave 异地备份完成"
#zip -r ${BACKUP}/phpdb/${TIMESTAMP}.zip ${BACKUP}/phpdb/${TIMESTAMP}_*  
#rm -rf ${BACKUP}/phpdb/${TIMESTAMP}_

innobackupex --defaults-file=/etc/my_3308.cnf  --user=root --password='123456' ${BACKUP}/php_dc_log
cd $(BACKUP)/php_dc_log &&  zip -r   ./`date +%Y-%m-%d`.zip  ./`date +%Y-%m-%d`*/*   && find ./  -name `date +%Y-%m-%d`_*  -type d  -exec rm -rf {} \;

#curl http://175.41.29.186:29933 -H 'command:notify' -d " hx_dc_log_* MYSQL_slave 异地备份完成"
#cd ${BACKUP}/php_dc_log/ && zip -r ${TIMESTAMP}.zip ./${TIMESTAMP}_* && find ./ | grep -v *.zip | xargs rm -rf



find ${BACKUP}/gamedb  -mtime +3 -type f -name "*" -exec rm -rf {} \;
find ${BACKUP}/phpadmin  -mtime +3 -type f -name "*" -exec rm -rf {} \;
find ${BACKUP}/php_dc_log  -mtime +3 -type f -name "*" -exec rm -rf {} \;

#find ${BACKUP}/php_dc_log -mtime +5 -delete

