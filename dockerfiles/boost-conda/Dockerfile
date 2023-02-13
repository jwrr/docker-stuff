# Dockerfile for C++ with Boost
FROM ubuntu:20.04

# Install G++, Python3 and Conan (which is written in Python)
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install build-essential cmake cpio curl debianutils gawk \
    gcc-multilib git gparted gtkterm iproute2 iputils-ping net-tools \
    libncurses5 libncurses5-dev libssl-dev libtool libegl1-mesa libsdl1.2-dev \
    libselinux1 libtool libxv-dev lua5.3 pax python3 python3-git \
    python3-jinja2 python3-pexpect python3-pip pylint3 screen texinfo \
    tftpd-hpa wget xz-utils zlib1g zlib1g-dev emacs vim
RUN pip3 install conan --upgrade

RUN mkdir /workspace


## Install Conda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py310_23.1.0-1-Linux-x86_64.sh
RUN chmod 755 ./Miniconda3-py310_23.1.0-1-Linux-x86_64.sh
RUN ./Miniconda3-py310_23.1.0-1-Linux-x86_64.sh -b

## Start Conda
ENV PATH=/root/miniconda3/bin:$PATH
RUN conda install -c conda-forge boost




## Compile and run example test
#RUN cmake ~/conan_boost_prj -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=~/conan_boost_prj/build/conan_toolchain.cmake
#RUN cmake --build ~/conan_boost_prj/build --config Release
#RUN ~/conan_boost_prj/build/boost_example


