FROM tensorflow/tensorflow:latest-gpu-py3

RUN apt-get update -y && \
    apt-get upgrade -y

RUN pip install keras h5py pillow opencv-python scikit-plot
RUN apt-get install -y python3-tk cython git nano

ENV TERM xterm
ENV PATH $PATH:$PATH:/usr/local/nvidia/bin/
