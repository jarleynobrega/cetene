#!/bin/bash

echo "Porta: $1"

# Atualizacao dos pacotes da imagem do Ubuntu
apt-get update -y
apt-get upgrade -y

# Instalacao de pacotes adicionais de Python
apt-get install -y python3-tk cython git nano openssh-server libblas-dev liblapack-dev

# Instalacao de pacotes para analise de polimorfismos
apt-get install -y libncurses5-dev libbz2-dev liblzma-dev

# Instalacao do R
apt-get install -y r-base

# Instalacao do PyTorch e torchvision
pip3 install http://download.pytorch.org/whl/cu80/torch-0.2.0.post3-cp35-cp35m-manylinux1_x86_64.whl 
pip3 install torchvision

# Configuracao do servidor SSH para acesso externo
sed -i "s/Port 22/Port $1/" /etc/ssh/sshd_config
sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

/etc/init.d/ssh stop
sleep 10
/etc/init.d/ssh start
sleep 10

echo "export TERM xterm" >> ~/.bashrc
echo "export PATH=$PATH:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/bin:/sbin:/usr/local/nvidia/bin/" >> ~/.bashrc

