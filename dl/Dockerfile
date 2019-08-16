FROM tensorflow/tensorflow:latest-gpu-py3

USER root:root

# Instalacao inicial do pacote pandas
RUN pip install pandas

# Copia do script de inicializacao e configuracao do container
COPY ./init.sh .

RUN chmod +x ./init.sh

# Execucao do script e sleep para evitar o restart do container
CMD /bin/bash init.sh; trap : TERM INT; sleep infinity & wait 




