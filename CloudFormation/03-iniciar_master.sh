#!/bin/bash
sudo kubeadm init 
sleep 60s
kubeadm token create --print-join-command > /tmp/comando_kubeadm_join.txt
echo Iniciado o cluster >> 03-iniciar_master.txt
mkdir /root/.kube
cp -i /etc/kubernetes/admin.conf /root/.kube/config
echo Copiado o arquivo de configuração >> 03-iniciar_master.txt
modprobe br_netfilter ip_vs_rr ip_vs_wrr ip_vs_sh nf_conntrack_ipv4 ip_vs
echo br_netfilter >> /etc/modules
echo ip_vs_rr ip_vs_wrr >> /etc/modules
echo ip_vs_sh >> /etc/modules
echo nf_conntrack_ipv4 >> /etc/modules
echo ip_vs >> /etc/modules
echo Iniciados módulos do kernel >> 03-iniciar_master.txt
sudo kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
echo Configurado o Weave Net >> 03-iniciar_master.txt

