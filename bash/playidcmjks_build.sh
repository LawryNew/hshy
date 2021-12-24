#!/bin/bash


Pro=$1
Time=$(date +%Y%m%d%H%M)
ProName=$( echo ${Pro} | sed  's/\.//g') #服务命名小写
lowcase=${ProName,,} ##去除小数点
#echo $ProName

cd /data/Project/${Pro}/ && docker build -t 192.168.0.12/playdev/$lowcase:${Time} . && docker push 192.168.0.12/playdev/$lowcase:${Time} 
##如何还原？直接拿时间戳镜像还原，定时清理镜像即可。

num=`kubectl get pod |grep $lowcase|wc -l`

if [ $num -eq 1 ];
then
kubectl delete pod $lowcase && echo "旧pod删除中..." && sleep 3
kubectl run  $lowcase  --image="192.168.0.12/playdev/$lowcase:${Time}" && echo "新pod已启动"   
else
kubectl run  $lowcase  --image="192.168.0.12/playdev/$lowcase:${Time}"  && echo "无旧pod,新pod正在启动"
fi

#kubectl expose pod/$ProName --type="NodePort"  &&i 
echo "svc待创建"
#func_restart_pod(){
#kubectl delete -f /data/yaml/$Pro/*-deployment.yaml && echo "删除旧pod中..." && sleep 3 && kubectl create -f /data/yaml/$Pro/*-deployment.yaml && echo "新pod已启动"
#}
#func_restart_pod
