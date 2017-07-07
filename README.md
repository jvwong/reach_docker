# reach_docker

A docker for the WebUI of [clulab/reach](https://github.com/clulab/reach/blob/master/README.md) NLP.

## Software requirements

Docker >= 17.0

## Getting started

1. Pull the image from DockerHub

  ```shell
    $ docker pull jvwong/reach_docker:master
  ```

2. Start the container

  ```shell
   $ docker run -t --rm --name reach_webui -p 8888:8888 jvwong/reach:master
  ```

3. Point your browser to [localhost port 8888](http://localhost:8888)
