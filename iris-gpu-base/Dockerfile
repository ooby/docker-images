FROM tensorflow/tensorflow:latest-gpu-jupyter
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y apt-utils xz-utils python3-dev python3-pip wget htop
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq libglib2.0-0
RUN apt-get install -y git libsm6 libxext6 libxrender-dev vim openssh-client \
    libcudnn7-dev python-setuptools libboost-python-dev libboost-thread-dev
RUN pip3 install pip --upgrade
RUN pip3 install cython pytest numpy pandas matplotlib jupyter zeep xlrd \
    pydicom pynetdicom pynrrd pillow scipy scikit-image scikit-learn \
    SimpleITK xgboost itk tensorflow keras-segmentation opencv-python
RUN mkdir /root/.ssh/
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts
WORKDIR /input
RUN git clone --branch master https://github.com/HealthplusAI/python3-gdcm.git
RUN cd python3-gdcm && dpkg -i build_1-1_amd64.deb && apt-get install -f
RUN cp /usr/local/lib/gdcm.py /usr/local/lib/python3.6/dist-packages/.
RUN cp /usr/local/lib/gdcmswig.py /usr/local/lib/python3.6/dist-packages/.
RUN cp /usr/local/lib/_gdcmswig.so /usr/local/lib/python3.6/dist-packages/.
RUN cp /usr/local/lib/libgdcm* /usr/local/lib/python3.6/dist-packages/.
RUN ldconfig
RUN pip3 install pycuda