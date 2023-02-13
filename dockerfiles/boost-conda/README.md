jwrr/boost-conda/Dockerfile
=====================

Boost + G++ using conda

On the host side have you code in $PWD.

Build Docker Image and Container
--------------------------------

```
## Build Docker Image
export DOCKERFILE_PATH=.
export DOCKER_IMAGE_TAG=jwrr/boost-conda
sudo docker build -t $DOCKER_IMAGE_TAG $DOCKERFILE_PATH

## Verify image was built
sudo docker images

```

Start Bash Shell in Docker Container
--------------------

```
## Run shell ininteractive mode
sudo docker run -it -v $PWD:/workspace $DOCKER_IMAGE_TAG bash
```

Compile and Run program in Container
------------------------------------

```
cd /workspace
ls  # this should show the host's files
mkdir build
cd build
cmake ..
make
./a.out
```

Stop Docker Container
---------------------

```
## Stop container
exit
```

Remove Docker Container and Image
---------------------------------

```
## Remove Container
sudo docker rm $DOCKER_CONTAINER_NAME

## shared C++ files are still on the host

## Verify container has been removed
sudo docker ps -a

## Remove Image
sudo docker rmi $DOCKER_IMAGE_TAG

## Verify image has been removed
sudo docker images
```


# ======================================
# CONDA WITH GCC+BOOST
conda create -n GCC_BOOST
conda activate GCC_BOOST
conda install -c conda-forge cxx-compiler
conda install -c conda-forge boost-cpp
conda install -c meznom boost-test
lued boost_test_example.cpp
========================================
#define BOOST_TEST_MODULE const_string test
#include <boost/test/unit_test.hpp>
BOOST_AUTO_TEST_CASE(dummy) {
BOOST_CHECK(1 + 1 == 2);
}
========================================
g++ boost_test_example.cpp -isystem /home/jwrr/anaconda3/envs/GCC_BOOST/include -DBOOST_TEST_DYN_LINK -L/home/jwrr/anaconda3/envs/GCC_BOOST/lib -lboost_unit_test_framework
export LD_LIBRARY_PATH=/home/jwrr/anaconda3/envs/GCC_BOOST/lib
./a.out
conda deactivate 
