FROM ubuntu:bionic

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install python3-dev python3-pip apt-utils wget -y && pip3 install pip --upgrade
RUN apt-get install git curl gnupg2 ca-certificates lsb-release net-tools -y
RUN echo "deb http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" | tee /etc/apt/sources.list.d/nginx.list
RUN curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key add -
RUN apt-get update
RUN apt-get install nginx
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

ARG SSH_PRIVATE_KEY
RUN mkdir /root/.ssh/
RUN echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa
RUN chmod 400 /root/.ssh/id_rsa

RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

ENV APP_PATH=/iris-server
WORKDIR /

RUN git clone git@github.com:ooby/pycovid.git iris-server

WORKDIR $APP_PATH
RUN mkdir -p /input/uploads
RUN ln -s /input/uploads $APP_PATH/uploads
RUN pip3 install -r requirements.txt
WORKDIR $APP_PATH/client
RUN npm install
RUN npm run build
RUN mkdir -p /www/iris-server && cp -rvf build/* /www/iris-server/
RUN mkdir -p /etc/nginx/sites-available && mkdir -p /etc/nginx/sites-enabled
RUN cp -vf ../nginx/nginx.conf /etc/nginx/ && cp -vf ../nginx/iris-server.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/iris-server.conf /etc/nginx/sites-enabled/iris-server.conf

WORKDIR $APP_PATH/server
RUN npm install
CMD nginx && npm start