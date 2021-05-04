FROM lhioh/centos7:v9
ADD ./mongo-org-3.4.repo   /etc/yum.repos.d/
RUN  yum -y install mongodb-org
RUN  mkdir -p /data/mongodb/{logs,data,run}
ADD mongod.conf /data/mongodb/run/
VOLUME /data/mongodb/logs/
VOLUME /data/mongodb/data/
VOLUME /data/mongodb/run/
EXPOSE 27017



##创建镜像
## docker build -t  lhioh/mongodb:v8 .

#  创建容器后启动，
#ENTRYPOINT [ "mongod  --config=/data/mongodb/run/mongod.conf --dbpath=/data/mongodb/data/ --logpath=/data/mongodb/logs/mongo.log  --fork" ]

#创建容器
#docker run -it --name mongo -p 27017:27017 -v /data/mongodb/data:/data/mongodb/data/  /data/mongodb/logs/:/data/mongodb/logs/ /data/mongodb/run/:/data/mongodb/run/  lhioh/mongodb:v8 /bin/bash
