FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y python3.7 python3.7-dev curl python3.7-distutils
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 2
RUN echo 2 | update-alternatives --config python3
RUN rm -f /usr/bin/python3
RUN ln -s python3.7 /usr/bin/python3
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3.7 get-pip.py && rm -f get-pip.py
RUN apt-get install -y apt-utils xz-utils wget htop
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq libglib2.0-0
RUN apt-get install -y git libsm6 libxext6 libxrender-dev vim openssh-client libgl1-mesa-dev
RUN pip3 install pip --upgrade
RUN pip3 install scp cython pytest numpy numpy-stl pandas matplotlib jupyter zeep xlrd pytz imageio==2.5.0 \
    pika pydicom pynetdicom pynrrd pillow scipy==1.4.1 scikit-image scikit-learn rm \
    SimpleITK xgboost==1.2.0 itk tensorflow-gpu==2.2.0 keras-segmentation==0.3.0 opencv-python pymongo sshtunnel
RUN mkdir /root/.ssh/
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts
WORKDIR /input
ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
RUN ldconfig
RUN apt-get install -y build-essential
RUN pip3 install pycuda
