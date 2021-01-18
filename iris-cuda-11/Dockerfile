FROM nvidia/cuda:11.1-devel-ubuntu20.04
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3-dev python3-pip curl python3-distutils python3-gdcm
RUN apt-get install -y apt-utils xz-utils wget htop
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq libglib2.0-0
RUN apt-get install -y git libsm6 libxext6 libxrender-dev vim openssh-client libgl1-mesa-dev
RUN apt-get update && apt-get install -y --no-install-recommends \
    gnupg2 curl ca-certificates && \
    curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub | apt-key add - && \
    echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64 /" > /etc/apt/sources.list.d/cuda.list && \
    echo "deb https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu2004/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list
RUN apt-get install -yq libcudnn8-dev=8.0.5.39-1+cuda11.1
RUN pip3 install pip --upgrade
RUN pip3 install scp cython pytest numpy numpy-stl pandas matplotlib jupyter zeep xlrd pytz imageio \
    pika pydicom pynetdicom pynrrd pillow scipy scikit-image scikit-learn rm \
    SimpleITK xgboost==1.2.0.1 itk tensorflow-gpu keras-segmentation opencv-python pymongo sshtunnel
RUN mkdir /root/.ssh/
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts
WORKDIR /data
ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
RUN ln -s /usr/local/cuda/lib64/libcusolver.so.11 /usr/local/cuda/lib64/libcusolver.so.10
RUN ldconfig
RUN apt-get install -y build-essential
RUN pip3 install pycuda
