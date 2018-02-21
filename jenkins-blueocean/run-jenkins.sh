#!/bin/bash

# Default values of the container
NAME="jenkins-blueocean"
PORT="8080"
DIR="$PWD/jenkins"

# Parse options
usage() {
    echo "Usage: $0"
    echo "    -h : shows the usage"
    echo "    -d <host-dir> : optional. This should be an absolute path. \"$PWD/jenkins\" is the default location."
    echo "    -n <name> : optional. \"jenkins-blueocean\" is the default name."
    echo "    -p <port> : optional. \"8080\" is the default port number."
    exit 1
}

while getopts ":d:n:p:h" o;
do
    case "${o}" in
        h)
            usage
            ;;
        d)
            DIR=${OPTARG}            
            ;;
        n)
            NAME=${OPTARG}
            ;;
        p)
            PORT=${OPTARG}
            ;;
        \?)
            usage
            ;;
        :)
            usage
            ;;
    esac
done
shift $((OPTIND-1))


# Run a container of jenkins blueocean
echo "Start running a jenkins container. name=$NAME, port=$PORT, dir=$DIR"

if [ ! -d "$DIR" ]; then
    mkdir -p $DIR
fi

docker run \
       -u root \
       -d \
       -p $PORT:8080 \
       -v $DIR:/var/jenkins_home \
       -v /var/run/docker.sock:/var/run/docker.sock \
       --name $NAME \
       jenkinsci/blueocean
