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

## Change to non-root account
RUN useradd -rm -d /home/docker -s /bin/bash -g root -G sudo -u 1001 docker -p "$(openssl passwd -1 docker)"
USER docker
WORKDIR /home/docker

## Create build directory
RUN mkdir -p ~/conan_boost_prj/build

## Create conanfile.txt
#RUN echo '[env]' >> ~/conan_boost_prj/conanfile.txt
#RUN echo 'CONAN_USER_HOME=/home/docker' >> ~/conan_boost_prj/conanfile.txt
#RUN echo '' >> ~/conan_boost_prj/conanfile.txt
RUN echo '[requires]' >> ~/conan_boost_prj/conanfile.txt
RUN echo 'boost/1.81.0' >> ~/conan_boost_prj/conanfile.txt
RUN echo '' >> ~/conan_boost_prj/conanfile.txt
RUN echo '[build_requires]' >> ~/conan_boost_prj/conanfile.txt
RUN echo 'cmake/3.25.1' >> ~/conan_boost_prj/conanfile.txt
RUN echo '' >> ~/conan_boost_prj/conanfile.txt
RUN echo '[generators]' >> ~/conan_boost_prj/conanfile.txt
RUN echo 'CMakeDeps' >> ~/conan_boost_prj/conanfile.txt
RUN echo 'CMakeToolchain' >> ~/conan_boost_prj/conanfile.txt
RUN echo 'VirtualBuildEnv' >> ~/conan_boost_prj/conanfile.txt

## Use Conan to build Boost library
WORKDIR /home/docker/conan_boost_prj/build
RUN conan install .. --build=boost
RUN chmod 755 ./conanbuild.sh
RUN ./conanbuild.sh

## Create CMakeLists.txt
RUN echo 'cmake_minimum_required(VERSION 3.15)' >> ~/conan_boost_prj/CMakeLists.txt
RUN echo 'set(CMAKE_CXX_STANDARD 14)' >> ~/conan_boost_prj/CMakeLists.txt
RUN echo 'project (boost_example)' >> ~/conan_boost_prj/CMakeLists.txt
RUN echo 'FIND_PACKAGE(Boost COMPONENTS program_options REQUIRED)' >> ~/conan_boost_prj/CMakeLists.txt
RUN echo 'INCLUDE_DIRECTORIES(${Boost_INCLUDE_DIR})' >> ~/conan_boost_prj/CMakeLists.txt
RUN echo 'ADD_EXECUTABLE(boost_example main_test.cpp)' >> ~/conan_boost_prj/CMakeLists.txt
RUN echo 'TARGET_LINK_LIBRARIES(boost_example LINK_PUBLIC ${Boost_LIBRARIES})' >> ~/conan_boost_prj/CMakeLists.txt

## Create main_test.cpp
RUN echo "#define BOOST_TEST_MODULE FirstTestModule" > ~/conan_boost_prj/main_test.cpp
RUN echo "#include <boost/test/unit_test.hpp>"  >> ~/conan_boost_prj/main_test.cpp
RUN echo "" >> ~/conan_boost_prj/main_test.cpp
RUN echo "BOOST_AUTO_TEST_CASE(FirstTestCase)" >> ~/conan_boost_prj/main_test.cpp
RUN echo "{" >> ~/conan_boost_prj/main_test.cpp
RUN echo "  BOOST_CHECK(5 == 5);" >> ~/conan_boost_prj/main_test.cpp
RUN echo "  BOOST_CHECK_EQUAL(9, 9);" >> ~/conan_boost_prj/main_test.cpp
RUN echo "  BOOST_CHECK_LT(8, 9);" >> ~/conan_boost_prj/main_test.cpp
RUN echo "  BOOST_CHECK_GT(10, 9);" >> ~/conan_boost_prj/main_test.cpp
RUN echo "}" >> ~/conan_boost_prj/main_test.cpp

## Compile and run example test
RUN cmake ~/conan_boost_prj -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=~/conan_boost_prj/build/conan_toolchain.cmake
RUN cmake --build ~/conan_boost_prj/build --config Release
RUN ~/conan_boost_prj/build/boost_example


