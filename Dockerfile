FROM tensorflow/tensorflow:latest-gpu-py3

# Atualizacao dos pacotes da imagem do Ubuntu
RUN apt-get update -y && \
    apt-get upgrade -y

# Instalacao dos principais pacotes de Python
RUN pip install keras h5py pillow opencv-python scikit-plot
RUN apt-get install -y python3-tk cython git nano openssh-server

# Variaveis de ambiente
ENV TERM xterm
ENV PATH /root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/bin:/sbin:/usr/local/nvidia/bin/

# Configuracao do servidor SSH
RUN mkdir /var/run/sshd
RUN echo 'root:cetene' | chpasswd
RUN sed -i 's/Port 22/Port 2225/' /etc/ssh/sshd_config
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
#RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

#EXPOSE 2225

#CMD ["/usr/sbin/sshd", "-D"]

CMD bash -C '/etc/init.d/ssh start';'bash'

