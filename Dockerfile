FROM tensorflow/tensorflow:latest-gpu-py3

# Atualizacao dos pacotes da imagem do Ubuntu
RUN apt-get update -y && \
    apt-get upgrade -y

# Instalacao dos principais pacotes de Python
RUN pip install keras h5py pillow opencv-python scikit-plot
RUN apt-get install -y python3-tk cython git nano openssh-server

ADD init.sh /root
RUN chmod +x /root/init.sh

ENTRYPOINT ["/root/init.sh"]

