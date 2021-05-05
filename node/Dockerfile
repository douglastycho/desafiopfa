FROM node:15

WORKDIR /usr/src/app

COPY index.js .

RUN npm init -y
RUN npm install express --save
RUN npm install mysql --save

RUN apt-get update \
    && apt-get install -y wget

ENV DOCKERIZE v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE/dockerize-linux-amd64-$DOCKERIZE.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE.tar.gz