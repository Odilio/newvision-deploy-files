#!/bin/bash
apt-get update && apt-get install -y apache2
echo Instalado o Apache >> 04-compart_comando_join.txt
cp /tmp/comando_kubeadm_join.txt /var/www/html/
chown www-data.www-data /var/www/html/comando_kubeadm_join.txt
echo Copiado o arquivo >> 04-compart_comando_join.txt
systemctl disable apache2
systemctl start apache2
echo Configurado o Apache >> 04-compart_comando_join.txt

