FROM nginx:latest

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/

RUN apt-get update \
    && apt-get install -y wget

ENV DOCKERIZE v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE/dockerize-linux-amd64-$DOCKERIZE.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE.tar.gz