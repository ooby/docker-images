FROM yakmed/jupyter-base
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install git -y
RUN pip3 install pydicom scipy scikit-image pynrrd setuptools xgboost
WORKDIR /input
ENV APP_PATH=/input/pycovid
RUN git clone https://github.com/ooby/cgh2020.git pycovid
WORKDIR $APP_PATH
RUN pip3 install -r requirements.txt