FROM tensorflow/tensorflow:latest-gpu-py3

RUN apt-get update -y && \
    apt-get upgrade -y

RUN pip install keras h5py pillow opencv-python scikit-plot
