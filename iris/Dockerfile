FROM yakmed/jupyter-dicom

ARG TIMEZONE
ENV TZ="${TIMEZONE}"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get upgrade -y
RUN pip3 install pip --upgrade
RUN apt-get install git -y

ARG SSH_PRIVATE_KEY
RUN mkdir /root/.ssh/
RUN echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa
RUN chmod 400 /root/.ssh/id_rsa

RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

WORKDIR /
RUN git clone git@github.com:ooby/pycovid.git pycovid

ARG MO_CODE
RUN touch /code && echo "${MO_CODE}" > /code

CMD python3 /pycovid/iris/store.py 0.0.0.0 104