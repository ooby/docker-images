FROM tensorflow/tensorflow:latest-gpu-jupyter
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install apt-utils -y
RUN apt-get install vim python3-dev python3-pip wget htop -y && pip3 install pip --upgrade
RUN pip3 install cython pytest numpy pandas matplotlib jupyter zeep xlrd
RUN pip3 install pydicom pynrrd scipy scikit-image scikit-learn xgboost
RUN mkdir /input
WORKDIR /input
