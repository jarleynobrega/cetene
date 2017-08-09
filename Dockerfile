FROM tensorflow/tensorflow:1.0.1-gpu-py3

# Atualizacao dos pacotes da imagem do Ubuntu
RUN apt-get update -y && \
    apt-get upgrade -y

# Instalacao dos principais pacotes de Python para deep learning
RUN pip install keras h5py pillow opencv-python scikit-plot
RUN apt-get install -y python3-tk cython git nano openssh-server

RUN sed -i 's/Port 22/Port 2225/' /etc/ssh/sshd_config
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN echo 'root:cetene' | chpasswd
RUN /etc/init.d/ssh start


