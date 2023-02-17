
## ==================================================================
## Docker
export DOCKER_FILES=$mygit/docker-stuff/dockerfiles
export DOCKER_USER=$USERNAME
export DOCKER_IMAGE=$DOCKER_USER/boost_1_81
export DOCKER_CONTAINER=boost_1_81
alias docker='sudo docker'
alias dstopall='docker stop `sudo docker ps -q`'
alias drmall='docker rm `docker ps -aq` && docker ps -a'
alias dcdfiles='cd $DOCKER_FILES; ls; pwd'
alias dfiles='ls -d $DOCKER_FILES/* |sed -s "s#.*/##"'
alias dbuild='docker build -t $DOCKER_USER/$DOCKER_IMAGE $DOCKER_FILES/$DOCKER_IMAGE'
alias drun='docker run --rm -v ${PWD}:/workspace $DOCKER_IMAGE'
alias dbash='docker run -it --rm -v ${PWD}:/workspace $DOCKER_IMAGE bash'
alias debash='docker exec -it $DOCKER_CONTAINER bash'
alias dps="docker ps -a && docker ps"
alias dbuild_commands='echo FROM MAINTAINER COPY ADD RUN USER WORKDIR CMD ENV'

