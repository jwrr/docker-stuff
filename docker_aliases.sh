
## ==================================================================
## Docker
export dkfiles=$mygit/docker-stuff/dockerfiles
alias cddkfiles='cd $dkfiles; ls; pwd'
alias dkfiles='ls -d $dkfiles/* |sed -s "s#.*/##"'
function dkbuild { sudo docker build -t $1 $dockerfiles/$1; }
alias dkcreate='sudo docker create'
alias dkstart='sudo docker start'
alias dkstop='sudo docker stop'
alias dkkill='sudo docker kill'
alias dkrestart='sudo docker restart'
alias dkpause='sudo docker pause'
alias dkunpause='sudo docker unpause'
alias dkrm='sudo docker rm'
alias dkps='sudo docker ps'
alias dkpsa='sudo docker ps -a'
alias dktop='sudo docker top'
alias dkdiff='sudo docker diff'
alias dkinspect='sudo docker inspect'
alias dkattach='sudo docker attach'
alias dkcp='sudo docker cp'
alias dkexport='sudo docker export'
alias dkexec='sudo docker exec'
alias dkwait='sudo docker wait'
alias dkcommit='sudo docker commit'
alias dkimages='sudo docker images'
alias dkhistory='sudo docker history'
alias dktag='sudo docker tag'
alias dkimport='sudo docker import'
alias dkrmi='sudo docker rmi'
alias dkpull='sudo docker pull'
alias dkpush='sudo docker push'
alias dksearch='sudo docker search'
alias dklogin='sudo docker login'
alias dklogout='sudo docker logout'
alias dksave='sudo docker save'
alias dkload='sudo docker load'
alias dk_build_commands='echo FROM MAINTAINER COPY ADD RUN USER WORKDIR CMD ENV'



