jwrr/luvit/Dockerfile
=====================

Static page web server using Lua and Luvit. Asynchronous I/O for Lua. Similar to Node.js.

Place your new content into the `content` folder.

Luvit Links
-----------

* [Documentation](https://luvit.io/)
* [Github](https://github.com/luvit/luvit)
* [Coderwall](https://coderwall.com/p/gkokaw/luvit-node-s-ziggy-stardust)


Build Docker Image and Container
--------------------------------

```
## Set path to Dockerfile.  Here are two examples. The first is from github, 
## the second is current directory
export DOCKERFILE_PATH=https://raw.githubusercontent.com/jwrr/docker-stuff/main/dockerfiles/luvit/Dockerfile
export DOCKERFILE=.

## Build Docker Image
export DOCKER_IMAGE_TAG=jwrr/luvit-static-server
sudo docker build -t $DOCKER_IMAGE_TAG $DOCKERFILE_PATH

## Verify image was built
sudo docker images

## Create container from image
export DOCKER_CONTAINER_NAME=luvit1
export DOCKER_HOST_PORT=1337
export DOCKER_CONTAINER_PORT=1337
export DOCKER_CONTAINER_DIR=/var/local/luvit

sudo docker create -p $DOCKER_HOST_PORT:$DOCKER_CONTAINER_PORT -v $PWD:$DOCKER_CONTAINER_DIR --name $DOCKER_CONTAINER_NAME $DOCKER_IMAGE_TAG

## Verify container was created
sudo docker ps -a
```


Start and Run Docker Container
--------------------

```
## Start container
sudo docker start $DOCKER_CONTAINER_NAME
sudo docker ps

## Use container
firefox localhost:1337
# You should see a webpage
```

Stop Docker Container
---------------------

```
## Stop container
sudo docker stop $DOCKER_CONTAINER_NAME

## Verify container is on longer active, but that it exists
sudo docker ps
sudo docker ps -a
```

Remove Docker Container and Image
---------------------------------

```
## Remove Container
sudo docker rm $DOCKER_CONTAINER_NAME

## Verify container has been removed
sudo docker ps -a

## Remove Image
sudo docker rmi $DOCKER_IMAGE_TAG

## Verify image has beein removed
sudo docker images
```

