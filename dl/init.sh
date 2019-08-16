#!/bin/bash

echo "Porta: $1"

# Atualizacao dos pacotes da imagem do Ubuntu
apt-get update -y
apt-get upgrade -y

# Instalacao de pacotes adicionais de Python
apt-get install -y python3-tk cython git nano openssh-server libblas-dev liblapack-dev

# Instalacao do R
# apt-get install -y r-base

# Instalacao do Screen
apt-get install -y screen

# Instalacao do PyTorch e torchvision
pip3 install torch torchvision

# Configuracao do servidor SSH para acesso externo
sed -i "s/Port 22/Port $1/" /etc/ssh/sshd_config
sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

/etc/init.d/ssh stop
sleep 10
/etc/init.d/ssh start
sleep 10

echo "export TERM xterm" >> ~/.bashrc
echo "export PATH=$PATH:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/bin:/sbin:/usr/local/nvidia/bin/" >> ~/.bashrc

