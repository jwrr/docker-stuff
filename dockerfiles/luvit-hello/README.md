jwrr/luvit-hello/Dockerfile
===========================

Luvit lua web server. Asynchronous I/O for Lua. Similar to Node.js. This is
simple hello world example.

* [Documentation](https://luvit.io/)
* [Github](https://github.com/luvit/luvit)
* [Coderwall - Ziggy Stardust slides](https://coderwall.com/p/gkokaw/luvit-node-s-ziggy-stardust)


Build Docker Image
------------------

```
## Build Docker Image
docker build -t jwrr/luvit-hello .

## Verify image was built
docker images
```

Run Docker Image
----------------

```
## Create container from image
docker run -d -p 1337:1337 --name luvit1 jwrr/luvit-hello

## Verify container is running
docker ps
```

Use Docker Image
----------------

From a host shell access the luvit server running in the docker container. You
should see the response `Hello World`.

```
curl localhost:1337
```

Stop Docker Container
---------------------

```
## Stop container
docker stop luvit1

## Verify container is on longer active, but that it exists
docker ps
docker ps -a
```

Remove Docker Container and Image
---------------------------------

```
## Remove Container
docker rm luvit1

## Verify container has been removed
docker ps -a

## Remove Image
docker rmi jwrr/luvit-hello

## Verify image has beein removed
docker images
```

