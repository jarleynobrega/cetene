FROM tensorflow/tensorflow:1.0.1-gpu-py3

# Atualizacao dos pacotes da imagem do Ubuntu
#RUN apt-get update -y && \
#    apt-get upgrade -y

# Instalacao dos principais pacotes de Python para deep learning
RUN pip install keras h5py pillow opencv-python scikit-plot
#RUN apt-get install -y python3-tk cython git nano openssh-server

#RUN sed -i 's/Port 22/Port 2225/' /etc/ssh/sshd_config
#RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

#RUN export TERM=xterm
#RUN export PATH=$PATH:/usr/local/nvidia/bin/

#RUN echo 'root:cetene' | chpasswd
#RUN /etc/init.d/ssh stop && sleep 10
#RUN /etc/init.d/ssh start && sleep 10

COPY ./init.sh .
#RUN /bin/bash init.sh
#ENTRYPOINT ["/bin/bash"]
#CMD ["init.sh"]

CMD exec /bin/bash init.sh
#CMD ["/bin/bash", "-c", "init.sh"]



