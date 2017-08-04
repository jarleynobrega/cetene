#!/bin/bash

export TERM xterm
export PATH=$PATH:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/bin:/sbin:/usr/local/nvidia/bin/

echo 'root:cetene' | chpasswd
sed -i 's/Port 22/Port 2225/' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

/etc/init.d/ssh stop
sleep 10
/etc/init.d/ssh start
sleep 10

