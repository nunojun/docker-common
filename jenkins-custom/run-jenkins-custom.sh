#!/bin/bash

IMAGE_NAME="jenkins-custom:0.1"
#IMAGE_NAME="localhost:5000/jenkins-custom:0.1"
NAME="jenkins-custom"
PORT=8080
DIR="$PWD/jenkins"

# TODO: Receive params..

if [ ! -d "$DIR" ]; then
    mkdir -p $DIR
fi

docker run \
    -d \
    -u root \
    -p $PORT:8080 \
    -v $DIR:/var/jenkins_home \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --name $NAME \
    $IMAGE_NAME

