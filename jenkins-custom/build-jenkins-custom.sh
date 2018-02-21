#!/bin/bash

IMAGE_NAME="jenkins-custom"
TAG="0.1"

# TODO: Change to receive arguments

docker build -t $IMAGE_NAME:$TAG .
