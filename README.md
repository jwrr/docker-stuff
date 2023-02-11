# docker-stuff
Docker notes and dockerfiles

Docker Images
-------------

luvit/Dockerfile
----------------

Run luvit lua web server. 

```
## Build Docker Image luvit
sudo docker build -t luvit ./dockerfiles/luvit

## Run luvit image in the background as a daemon
#sudo docker run -d -p 1337:1337 luvit4 /opt/luvit/server.lua
sudo docker run -d -p 1337:1337 luvit
curl localhost:1337

## Run luvit image in container with all ports enabled
sudo docker run --network host -d luvit
#in docker> luvit /opt/luvit/server.lua 

## Run luvit image interactively with one port enabled (docker_port:host_port)
sudo docker run -it -p 1337:1337 luvit bash

```


