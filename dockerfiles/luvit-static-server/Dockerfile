# Dockerfile for luvit server
FROM ubuntu:20.04
RUN apt-get -y clean
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install curl
RUN curl -L https://github.com/luvit/lit/raw/master/get-lit.sh | sh
RUN mv /lit /luvi /luvit /usr/local/bin
CMD ["/var/www/html/server.lua"]

