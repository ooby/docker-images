FROM ubuntu:focal
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y python3-dev python3-pip apt-utils wget
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install install cython pytest numpy pandas matplotlib jupyter zeep
RUN jupyter notebook --generate-config
RUN mkdir /data
WORKDIR /data