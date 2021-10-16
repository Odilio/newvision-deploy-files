#!/bin/bash
sleep 180s
echo Aguardando >> /tmp/05-iniciar_worker.txt
curl http://$(cat /tmp/ip_master.txt)/comando_kubeadm_join.txt > /tmp/comando_kubeadm_join.txt
sudo $(cat /tmp/comando_kubeadm_join.txt)
echo Incluido no cluster >> /tmp/05-iniciar_worker.txt
