FROM ubuntu:focal
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install apt-utils xz-utils wget htop build-essential -y
RUN apt-get install python3-dev python3-pip python3-gdcm -y && pip3 install pip --upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq libglib2.0-0
RUN apt-get install -y git libsm6 libxext6 libxrender-dev vim openssh-client
RUN pip3 install cython pytest numpy pandas matplotlib jupyter zeep xlrd \
    pydicom pynetdicom pynrrd pillow scipy scikit-image scikit-learn \
    SimpleITK xgboost itk tensorflow keras-segmentation opencv-python
RUN jupyter notebook --generate-config
RUN mkdir /input
WORKDIR /input