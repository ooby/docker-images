FROM yakmed/jupyter-base
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install python3-gdcm -y && pip3 install pip --upgrade
RUN pip3 install pydicom pynrrd scipy scikit-image scikit-learn xgboost
WORKDIR /input