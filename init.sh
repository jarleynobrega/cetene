#!/bin/bash

exec export TERM xterm
exec export PATH=$PATH:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/bin:/sbin:/usr/local/nvidia/bin/

exec apt-get update -y
exec apt-get upgrade -y

#pip install keras h5py pillow opencv-python scikit-plot
exec apt-get install -y python3-tk cython git nano openssh-server

exec sed -i 's/Port 22/Port 2225/' /etc/ssh/sshd_config
exec sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

exec echo 'root:cetene' | chpasswd

exec /etc/init.d/ssh stop
exec sleep 10
exec /etc/init.d/ssh start
exec sleep 10

#exit 0

