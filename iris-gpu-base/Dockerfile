FROM nvidia/cuda:11.0-runtime-ubuntu20.04
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y apt-utils xz-utils python3-dev python3-pip wget htop
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq libglib2.0-0
RUN apt-get install -y python3-gdcm libsm6 libxext6 libxrender-dev vim openssh-client
RUN pip3 install pip --upgrade
RUN pip3 install cython pytest numpy pandas matplotlib jupyter zeep xlrd \
    pydicom pynetdicom pynrrd pillow scipy scikit-image scikit-learn \
    SimpleITK xgboost itk tensorflow keras-segmentation opencv-python
RUN mkdir /root/.ssh/
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts
WORKDIR /input