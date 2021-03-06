FROM tensorflow/tensorflow:1.0.1-gpu-py3

# Instalacao inicial dos principais pacotes de Python para deep learning
RUN pip install keras h5py pillow opencv-python scikit-plot

# Copia do script de inicializacao e configuracao do container
COPY ./init.sh .

# Execucao do script e sleep para evitar o restart do container
CMD /bin/bash init.sh; trap : TERM INT; sleep infinity & wait 




