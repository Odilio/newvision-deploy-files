#!/bin/bash
echo '{
    "exec-opts": ["native.cgroupdriver=systemd"],
    "log-driver": "json-file",
    "log-opts": { "max-size":"100m" },
    "storage-driver": "overlay2"
}' >> /etc/docker/daemon.json
systemctl daemon-reload
systemctl restart docker
echo Configurado o daemon.json >> 02-instalar_k8s.txt
apt-get update && apt-get install -y apt-transport-https gnupg2
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
echo Configurado o apt >> 02-instalar_k8s.txt
apt-get update && apt-get install -y kubelet kubeadm kubectl
echo Instalado o kubernetes >> 02-instalar_k8s.txt

