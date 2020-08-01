FROM yakmed/jupyter-base
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install python3-gdcm -y && pip3 install pip --upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq libglib2.0-0
RUN apt-get install -y libsm6 libxext6 libxrender-dev vim
RUN pip3 install pydicom pynetdicom pynrrd pillow scipy scikit-image scikit-learn SimpleITK xgboost itk tensorflow keras-segmentation opencv-python
WORKDIR /input
RUN mkdir /root/.ssh/
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts