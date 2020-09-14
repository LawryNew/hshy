#!/bin/bash


wget https://cdn.mysql.com/archives/mysql-5.7/mysql-5.7.24-linux-glibc2.12-x86_64.tar.gz

tar -zxvf mysql-5.7.24-linux-glibc2.12-x86_64.tar.gz  -C /usr/local/

groupadd mysql && useradd -m -g mysql mysql

mv /usr/local/mysql-5.7.24-linux-glibc2.12-x86_64/   /usr/local/mysql


yum -y install libaio perl


###ADD  my.cnf


mkdir -p /data/mysql_3306/data  && chown -R mysql.mysql /usr/local/mysql  /data/mysql_3306/data

/usr/local/mysql/bin/mysqld --initialize --user=mysql --basedir=/usr/local/mysql --datadir=/data/mysql_3306/data

nohup /usr/local/mysql/bin/mysqld_safe --defaults-file=/etc/my_3306.cnf &



3306   DMefk3+_52kY
3307  /X!maius*4Q>
3308  UmtDpqb.a0Xf


