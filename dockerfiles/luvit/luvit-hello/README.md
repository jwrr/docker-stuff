jwrr/luvit-hello/Dockerfile
=====================

Luvit lua web server. Asynchronous I/O for Lua. Similar to Node.js. This is
simple hello world example.

* [Documentation](https://luvit.io/)
* [Github](https://github.com/luvit/luvit)
* [Coderwall - Ziggy Stardust slides](https://coderwall.com/p/gkokaw/luvit-node-s-ziggy-stardust)


Build Docker Image and Container
--------------------------------

```
## Build Docker Image
sudo docker build -t jwrr/luvit-hello https://raw.githubusercontent.com/jwrr/docker-stuff/main/dockerfiles/luvit/luvit-hello/Dockerfile

## Verify image was built
sudo docker images

## Create container from image
sudo docker create -p 1337:1337 --name luvit1 jwrr/luvit-hello

## Verify container was created
sudo docker ps -a
```


Start and Run Docker Container
--------------------

```
## Start container
sudo docker start luvit1
sudo docker ps

## Use container
curl localhost:1337
# You should see hello message
```

Stop Docker Container
---------------------

```
## Stop container
sudo docker stop luvit1

## Verify container is on longer active, but that it exists
sudo docker ps
sudo docker ps -a
```

Remove Docker Container and Image
---------------------------------

```
## Remove Container
sudo docker rm luvit1

## Verify container has been removed
sudo docker ps -a

## Remove Image
sudo docker rmi jwrr/luvit-hello

## Verify image has beein removed
sudo docker images
```

