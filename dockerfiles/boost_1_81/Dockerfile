# Dockerfile for C++ with Boost
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y clean
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y clean
RUN apt-get -y install build-essential autotools-dev cmake cpio curl expect
RUN apt-get -y install gawk gparted gtkterm libncurses5
RUN apt-get -y install libncurses5-dev libssl-dev libegl1-mesa libsdl1.2-dev
RUN apt-get -y install libselinux1 libtool libxv-dev libicu-dev libbz2-dev lua5.3 
RUN apt-get -y install pax python3 python3-dev 
RUN apt-get -y install python3-pip pylint3 screen texinfo
RUN apt-get -y install tftpd-hpa vim wget xz-utils zlib1g zlib1g-dev

RUN wget https://boostorg.jfrog.io/artifactory/main/release/1.81.0/source/boost_1_81_0.tar.gz
RUN tar zxvf boost_1_81_0.tar.gz
WORKDIR /boost_1_81_0
RUN ./bootstrap.sh
RUN ./b2 install

#RUN apt-get -y install libboost-all-dev
#RUN apt-get -y install libboost libboost-dev 

RUN mkdir -p /workspace
WORKDIR /workspace
ENV PATH=$PATH:.

