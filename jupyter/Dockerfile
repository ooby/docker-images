FROM sciberia/jupyter:latest
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apt-utils xz-utils wget htop python3-dev python3-pip curl python3-distutils python3-gdcm
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq libglib2.0-0
RUN apt-get install -y git libsm6 libxext6 libxrender-dev vim openssh-client libgl1-mesa-dev
RUN python3 -m pip install pip --upgrade
RUN python3 -m pip install imageio opencv-python pika pillow pymongo pydicom pynetdicom \
    scipy scikit-image scikit-learn SimpleITK sshtunnel
ARG TIMEZONE
ENV TZ="${TIMEZONE}"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ARG PASSWORD
ENV PSW="${PASSWORD}"
RUN python3 -c "from notebook.auth import passwd; print(passwd('$PSW'))" > /tmp/token
RUN export TOKEN=$(cat /tmp/token);echo "c.NotebookApp.password = u'$TOKEN'" >> /root/.jupyter/jupyter_notebook_config.py
CMD jupyter notebook --allow-root --no-browser --ip=0.0.0.0