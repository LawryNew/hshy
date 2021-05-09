FROM  lhioh/centos7:v9
RUN  mv /etc/yum.repos.d  /etc/yum.repos.d.bak
ADD ./Centos-7.repo  /etc/yum.repos.d/
RUN  yum clean all && yum makecache && yum -y install  epel-release gcc gcc-c++ make 
RUN mkdir -p /usr/local/redis/{bin,etc,logs,data}  
ADD ./redis-3.2.8.tar.gz  /usr/local/
ADD ./tcl8.6.1-src.tar.gz   /usr/local/
#RUN tar zxvf   /usr/local/redis-3.2.8.tar.gz  ##手动解压
#RUN tar zxvf /usr/local/tcl8.6.1-src.tar.gz ./ ##手动解压
RUN cd /usr/local/tcl8.6.1/unix && ./configure && make && make install 
RUN cd /usr/local/redis-3.2.8/ && make 
RUN cd /usr/local/redis-3.2.8/src  && make install 
#RUN mv mkreleasehdr.sh  redis-benchmark redis-check-aof  redis-check-rdb redis-cli redis-server   /usr/local/redis/bin/ ##手动移动启动脚本
ADD ./redis.conf   /usr/local/redis/etc/
#RUN  /usr/local/redis/bin/redis-server  /usr/local/redis/etc/redis.conf &  ##启动
EXPOSE 6379
