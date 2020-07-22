FROM ubuntu:bionic

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install python3-dev python3-pip apt-utils wget -y && pip3 install pip --upgrade
RUN apt-get install git -y

ARG SSH_PRIVATE_KEY
RUN mkdir /root/.ssh/
RUN echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa
RUN chmod 400 /root/.ssh/id_rsa

RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

ENV APP_PATH=/pycovid
WORKDIR /

RUN git clone git@github.com:ooby/pycovid.git pycovid

WORKDIR $APP_PATH
RUN pip3 install -r requirements.txt