jwrr/boost_1_81/Dockerfile
===========================

This Docker image has boost_1_81 and g++ installed. It is based on 
ubuntu:20.04. 

To build the Image
------------------

```
docker build -t jwrr/boost_1_81 .
```

* This may take a while as dependencies are download and
  Boost is compile from source.
* You can change the tag's username to your username.
* The `.` specifies the directory that has this Dockerfile

To Compile a Program
--------------------

This compiles your code that is located on the host with the gcc compiler
and boost libraries located in the container. The resulting a.out can
then be run on your host (or if you prefer, in your container).

```
docker run --rm -v .:/workspace jwrr/boost_1_81 g++ boost_version.cpp
```

Let's try to compile using `make` on the host. It fails because boost is
not installed.

```
make
g++ boost_version.cpp
boost_version.cpp:1:10: fatal error: boost/version.hpp: No such file or directory
    1 | #include <boost/version.hpp>
      |          ^~~~~~~~~~~~~~~~~~~
compilation terminated.
make: *** [Makefile:2: a.out] Error 1
```

Now lets try it again using the Docker container.

```
docker run --rm -v .:/workspace jwrr/boost_1_81 make
docker run --rm -v .:/workspace jwrr/boost_1_81 make
g++ boost_version.cpp

## Run compiled program in host
./a.out
1_81

## Run compiled program in container
docker run --rm -v .:/workspace jwrr/boost_1_81 ./a.out
1_81

```

* The `run` command spins up an new container based on the
  boost image.
* The `--rm` option deletes the container after it's done
* The '-v' option maps a host directory to a contain directory. This allows the
  container to access/compile host files.

If you want to run a shell script then you need to specify the shell like so.

```
docker run --rm -v .:/workspace jwrr/boost_1_81 bash compile.sh
```

If you want to an interactive shell running in the container do the following.

```
docker run -it --rm -v .:/workspace jwrr/boost_1_81 bash
root# pwd
root# ls
root# compile.sh 
```

* The `-it` option makes it an interactive session.
* `bash` is the shell.
* You will be `root` in the container, but not to the host.
