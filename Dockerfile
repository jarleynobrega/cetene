FROM tensorflow/tensorflow:latest-gpu-py3

# Atualizacao dos pacotes da imagem do Ubuntu
RUN apt-get update -y && \
    apt-get upgrade -y

# Instalacao dos principais pacotes de Python
RUN pip install keras h5py pillow opencv-python scikit-plot
RUN apt-get install -y python3-tk cython git nano openssh-server

# Variaveis de ambiente
ENV TERM xterm
ENV PATH $PATH:$PATH:/usr/local/nvidia/bin/

# Configuracao do servidor SSH
RUN mkdir /var/run/sshd
RUN echo 'root:cetene' | chpasswd
RUN sed -i 's/Port 22/Port 2225/' /etc/ssh/sshd_config
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# Restart do servico
# RUN /etc/init.d/ssh stop
# RUN /etc/init.d/ssh start

CMD ["/etc/init.d/ssh", "start"]
