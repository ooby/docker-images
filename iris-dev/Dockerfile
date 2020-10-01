FROM sciberia/iris:latest

ARG TIMEZONE
ENV TZ="${TIMEZONE}"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get upgrade -y
RUN pip3 install pip --upgrade

ARG MO_CODE
RUN touch /code && echo "${MO_CODE}" > /code

RUN export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
RUN ldconfig

WORKDIR /input