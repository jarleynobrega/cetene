#!/bin/bash

export TERM xterm
export PATH=$PATH:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/bin:/sbin:/usr/local/nvidia/bin/

apt-get update -y
apt-get upgrade -y

pip install keras h5py pillow opencv-python scikit-plot
apt-get install -y python3-tk cython git nano openssh-server

sed -i 's/Port 22/Port 2225/' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

echo 'root:cetene' | chpasswd

/etc/init.d/ssh stop
sleep 10
/etc/init.d/ssh start
sleep 10

