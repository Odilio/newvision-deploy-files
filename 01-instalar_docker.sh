#!/bin/bash
apt-get update
echo Atualizado apt > /tmp/01-instalar_docker.txt
apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
echo Instalados requisitos >> /tmp/01-instalar_docker.txt
curl -fsSL https://download.docker.com/linux/ubuntu/gpg|sudo apt-key add -
echo Download da chave do repositório >> /tmp/01-instalar_docker.txt
sudo apt-add-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable'
echo Adicionado repositório Docker >> /tmp/01-instalar_docker.txt
sudo apt update
echo Atualizado apt >> /tmp/01-instalar_docker.txt
sudo apt install -y docker-ce
echo Instalado o docker >> /tmp/01-instalar_docker.txt
sudo adduser ubuntu docker
echo Adicionado usuário ubuntu no grupo docker >> /tmp/01-instalar_docker.txt
sudo systemctl restart docker
echo Reiniciar serviço >> /tmp/01-instalar_docker.txt
sleep 5s
