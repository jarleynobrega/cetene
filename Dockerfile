FROM tensorflow/tensorflow:1.0.1-gpu-py3

# Instalacao dos principais pacotes de Python
RUN pip install keras h5py pillow opencv-python scikit-plot

#COPY ./init.sh /home


