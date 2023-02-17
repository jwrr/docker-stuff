jwrr/boost_1_81/Dockerfile
===========================

This Dockerfile creates an image that has boost_1_81 and g++ installed. It is
based on ubuntu:20.04.

To Install Docker
-----------------

**Do not use apt-get**.
Go to the [Docker site](https://docs.docker.com/desktop/install/linux-install/)
and follow the instructions.

To Build the Image
------------------

```
docker build -t jwrr/boost_1_81 .
```

* This may take a while as dependencies are downloaded and
  Boost is compiled from source.
* You can change the tag's `jwrr` to your username.
* The `.` specifies the directory that has this Dockerfile
* Take a look at the Dockerfile. It's a simple text file that's
  easy to understand and it's where the magic happens.

To Compile a C++ Program
------------------------

The following command compiles your code that is in your current host directory
using the compiler (and boost library) that are in the Docker image. The
resulting a.out can be run on your host or if you prefer, in your
container.

```
docker run --rm -v .:/workspace jwrr/boost_1_81 g++ boost_version.cpp
```

* The `run` command creates and starts a new container based on the
  boost image.
* The `--rm` option deletes the container after it's done.
* The `-v` option maps a host directory to a contain directory. This allows the
  container to access/compile host files. In this example your current host
  working directory `.` is mapped to the containers `\workspace` directory.


Let's try to compile using `make` directly on the host. Bonk, it fails because boost is
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

Now let's try compiling again using the Docker container.

```
docker run --rm -v .:/workspace jwrr/boost_1_81 make
g++ boost_version.cpp

## You can run the compiled program on the host.
./a.out
1_81

## Or you can run it in the container
docker run --rm -v .:/workspace jwrr/boost_1_81 ./a.out
1_81
```

If you want to run a shell script then you need to specify the shell and then
the script name, like so.

```
docker run --rm -v .:/workspace jwrr/boost_1_81 bash compile.sh
```

If you want to an interactive shell that runs in the container do the following.

```
docker run -it -v .:/workspace jwrr/boost_1_81 bash
root# pwd
root# ls
root# ./compile.sh
root# ./a.out
```

* The `-it` option makes it an interactive session.
* `bash` is the shell.
* You will be `root` in the container, but not to the host.
* **Warning** - Everything you put into the container will be lost when the
  container is deleted. The exception is that files in the shared `\workspace`
  directory will stay on the host.
