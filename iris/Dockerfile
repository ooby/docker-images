FROM sciberia/iris:latest

ARG TIMEZONE
ENV TZ="${TIMEZONE}"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get upgrade -y
RUN pip3 install pip --upgrade
RUN apt-get install git -y

ARG SSH_PRIVATE_KEY
RUN echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa
RUN chmod 400 /root/.ssh/id_rsa

ARG MO_CODE
RUN touch /code && echo "${MO_CODE}" > /code

WORKDIR /input
RUN git clone git@github.com:ooby/iris.git iris

WORKDIR /input/iris

CMD pip3 install -e . && python3 ./utils/store.py 0.0.0.0 104
