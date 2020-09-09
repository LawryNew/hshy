
#！/bin/bash
yum -y install perl perl-devel libaio libaio-devel perl-Time-HiRes perl-DBD-MySQL && wget https://www.percona.com/downloads/XtraBackup/Percona-XtraBackup-2.4.9/binary/redhat/6/x86_64/percona-xtrabackup-24-2.4.9-1.el6.x86_64.rpm --no-check-certificate  &&   yum localinstall -y  percona-xtrabackup-24-2.4.9-1.el6.x86_64.rpm
