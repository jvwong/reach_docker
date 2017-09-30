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
   $ docker run -t --rm --name reach_webui -p 8080:8080 jvwong/reach_docker:master
  ```

3. Point your browser to [localhost port 8080](http://localhost:8080)

## Programmatic access

See the `index.js` which describes the javascript used by this web UI.

# Installing REACH on Ubuntu 16.04 Server

### TOC

- [Installing Dependencies](#installing-dependencies)
  - Java
  - Scala
  - sbt
  - CoreNLP
- [Installing Reach](#installing-reach)
- [Running Web-server](#running-web-server)

## Installing Dependencies

### Dependencies
1. Java 1.8
2. Scala 2.XX +
3. sbt
4. Stanford CoreNLP 3.X

#### Install Java 1.8

> You can check if java is already installed with: `java -version`

To install default Java Runtime environments and JDK:

```
sudo apt-get update
sudo apt-get install default-jre
sudo apt-get install default-jdk
```

#### Install Scala 2.XX

```
sudo apt-get update
sudo apt install scala
```

#### Install sbt
```
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update
sudo apt-get install sbt
```

#### Install Stanford CoreNLP 3.X (_unclear if this is necessary_)

Download CoreNLP [here](http://nlp.stanford.edu/software/stanford-corenlp-full-2017-06-09.zip), unzip.

Alternatively,

```
wget http://nlp.stanford.edu/software/stanford-corenlp-full-2017-06-09.zip
unzip stanford-corenlp-full-2017-06-09.zip
# add CoreNLP to classpath
cd stanford-corenlp-full-2017-06-09
for file in `find . -name "*.jar"`; do export
CLASSPATH="$CLASSPATH:`realpath $file`"; done
```

## Installing Reach

> __NOTE__: You will have to make any changes to the configuration file before compiling. One change I had to make was to the default timeout time:
> 1. `cd reach/main/src/main/resources`
> 2. open the `application.conf` and set `askTimeout` to a much larger number (something like 1,200s to garuntee the server doesn't time out the first time you run it).

1. Clone reach: `git clone https://github.com/clulab/reach.git`
2. `cd` to your local copy of Reach
3. check out the master branch: `git checkout master; git pull`
3. compile a FAT JAR configured to run the file processor server:
`sbt -DmainClass=org.clulab.reach.export.server.ApiServer assembly`

## Running Web-server

1. find (or move) the FAT JAR: `cd reach/target/scala-2.11`
2. run the FAT JAR (default port 8080): `java -Xm6G -jar reach-1.3.5-SNAPSHOT-FAT.jar`
3. for instructions on how to use the server, point your browser to http://localhost:8080/

#### Installing Ngrok

```
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
# adding ngrok to your PATH
CLASSPATH=$CLASSPATH:path/to/ngrok
```

#### Running Ngrok

Simply call: `ngrok http 8080` to generate a public facing URL for the Reach local server.

