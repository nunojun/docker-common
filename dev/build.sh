#!/bin/bash

VERSION_NUMBER=$1
if [ -z $VERSION_NUMBER ]; then
    echo "Version Number required for tagging!!"
    exit 1
fi

docker build -t dev:$VERSION_NUMBER -t dev-comcast:latest .

