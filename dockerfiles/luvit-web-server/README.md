jwrr/luvit-static-server/Dockerfile
===================================

This Dockerfile makes a static page web server using Lua and Luvit. 
Luvit provides asynchronous I/O for Lua, similar to Node.js.

Place your new content into the `content` folder.

Luvit Links
-----------

* [Documentation](https://luvit.io/)
* [Github](https://github.com/luvit/luvit)
* [Coderwall](https://coderwall.com/p/gkokaw/luvit-node-s-ziggy-stardust)


Build Docker Image
------------------

```
## Set path to Dockerfile.  Here are two examples. The first is from github, 
## the second is current directory

## Build Docker Image
export DOCKER_IMAGE_TAG=jwrr/luvit-static-server
docker build -t $DOCKER_IMAGE_TAG .

## Verify image was built
docker images

Start and Run Docker Container
--------------------

## Create and Start container from image
export DOCKER_CONTAINER_NAME=luvit1
export DOCKER_HOST_PORT=1337
export DOCKER_CONTAINER_PORT=1337
export DOCKER_CONTAINER_DIR=/var/www/html

docker run -d -p $DOCKER_HOST_PORT:$DOCKER_CONTAINER_PORT \
-v $PWD:$DOCKER_CONTAINER_DIR --name $DOCKER_CONTAINER_NAME $DOCKER_IMAGE_TAG

## Verify container is running
docker ps
```

Use Docker Container
--------------------

Using firefox access the container on port 1337. You should see a web page with
several image types and links.

```
firefox localhost:1337
```

Stop Docker Container
---------------------

```
## Stop container
docker stop $DOCKER_CONTAINER_NAME

## Verify container is on longer active, but that it exists
docker ps
docker ps -a
```

Remove Docker Container and Image
---------------------------------

```
## Remove Container
docker rm $DOCKER_CONTAINER_NAME

## Verify container has been removed
docker ps -a

## Remove Image
docker rmi $DOCKER_IMAGE_TAG

## Verify image has beein removed
docker images
```

