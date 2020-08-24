#!/bin/bash

#add ./my.cnf  /etc/my.cnf

yum install -y libaio

cd /data/  && mkdir -p /data/mysql/data
touch /data/mysql/mysql-error.log mysql-slow.log mysql.pid

wget https://cdn.mysql.com/archives/mysql-5.7/mysql-5.7.24-linux-glibc2.12-x86_64.tar.gz
tar -zxvf 	mysql-5.7.24-linux-glibc2.12-x86_64.tar.gz   -C /usr/local/mysql
	
	
groupadd mysql 
useradd -r -g mysql mysql 

chown -R mysql.mysql  /usr/local/mysql   /data/mysql/

/usr/local/mysql/bin/mysqld --initialize --user=mysql --basedir=/usr/local/mysql --datadir=/data/mysql/data
cat /var/log/messages |grep password


#add ./my.cnf  /etc/my.cnf


nohup  /usr/local/mysql/bin/mysqld_safe --defaults-file=/etc/my.cnf &




mysql -S /tmp/mysql.sock -uroot -p 




