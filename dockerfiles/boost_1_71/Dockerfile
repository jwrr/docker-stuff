# Dockerfile for C++ with Boost 1.70
FROM ubuntu:20.04

# ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y clean
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install curl
RUN apt-get -y install gawk emacs vim wget curl
RUN apt-get -y install build-essential
RUN apt-get -y install cmake cpio curl debianutils gawk
RUN apt-get -y install gcc-multilib git gparted gtkterm iproute2 iputils-ping net-tools
RUN apt-get -y install libncurses5 libncurses5-dev libssl-dev libtool libegl1-mesa libsdl1.2-dev
RUN apt-get -y install libselinux1 libtool libxv-dev lua5.3 pax python3 python3-dev python3-git
RUN apt-get -y install autotools-dev libicu-dev libbz2-dev libboost-all-dev
RUN apt-get -y install python3-jinja2 python3-pexpect python3-pip pylint3 screen texinfo
RUN apt-get -y install tftpd-hpa wget xz-utils zlib1g zlib1g-dev emacs vim

RUN apt-get -y install libboost-all-dev

RUN mkdir -p /workspace
WORKDIR /workspace
