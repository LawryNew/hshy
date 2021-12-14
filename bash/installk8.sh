#!/bin/bash

yum -y install epel-release 
IP=`ip addr |grep inet |grep ens | awk -F / '{print $1}'|awk '{print $2}'`

if [ $? -eq 0 ];then 
yum -y install wget vim curl yum-utils;
    if [ $? -eq 0 ];then
        systemctl stop firewalld && systemctl disable firewalld && echo "防火墙已关闭" && sleep 3;
        if [ $? -eq 0 ];then
            sed -i 's/enforcing/disabled/' /etc/selinux/config &&  setenforce 0  && echo "selinux已关闭" && sleep 3;
            if [ $? -eq 0 ];then
               swapoff -a &&  sed -ri 's/.*swap.*/#&/' /etc/fstab  && echo "已关闭交换分区" echo sleep 3;
               if [ $? -eq 0 ];then
                    read -p "请输入主机名: " Name;
                    hostnamectl set-hostname $Name && echo "主机名已修改" && sleep 3;
                    if [ $? -eq 0 ];then
                        echo $IP $Name >> /etc/hosts && echo "主机名已添加" && sleep 3;
                        if [ $? -eq 0 ];then
                            cat > /etc/sysctl.d/k8s.conf << EOF 
                            net.bridge.bridge-nf-call-ip6tables = 1
                            net.bridge.bridge-nf-call-iptables = 1
EOF
                            sysctl --system && echo "流量传递已配置"
                            if [ $? -eq 0 ]; then 
                               yum install ntpdate -y &&ntpdate time.windows.com && echo "时间已同步" && sleep 3;
                               if [ $? -eq 0 ];then
                                   wget https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo -O /etc/yum.repos.d/docker-ce.repo &&   yum -y install docker-ce-20.10.1-3.el7  &&  systemctl enable docker && systemctl start docker && docker --version && echo "docker已安装" && sleep 3;
                                    if [ $? -eq 0 ];then
                                        cat > /etc/yum.repos.d/kubernetes.repo << EOF
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=0
repo_gpgcheck=0
gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF
                                        yum install -y kubelet-1.18.0 kubeadm-1.18.0 kubectl-1.18.0 && systemctl enable kubelet && echo "kubelet adm ctl已安装" && sleep 3;
       if [ $? -eq 0 ];then
kubeadm init \
  --apiserver-advertise-address=${IP} \
  --image-repository registry.aliyuncs.com/google_containers \
  --kubernetes-version v1.18.0 \
  --service-cidr=10.96.0.0/12 \
  --pod-network-cidr=10.244.0.0/16 && echo "ks已初始化完毕" && sleep 3;
                                        if [ $? -eq 0 ];then
                                            read -p "是否作为master节点： "  ans
                                            if [ $ans == "是" ];then
                                                mkdir -p $HOME/.kube && sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config && sudo chown $(id -u):$(id -g) $HOME/.kube/config && echo "已创建master节点文件夹" && sleep 3;
                                                if [ $? -eq 0 ]; then
                                                      kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml && kubectl get pods -n kube-system && echo "已创建网络" && kubectl get nodes && echo "nodes已ready"

                                                fi
                                            fi 
                                        fi
                                    fi
                               fi 
                            fi
                        fi

                    fi
 
               fi
            fi
        fi
      fi
   fi
fi
