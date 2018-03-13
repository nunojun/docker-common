#!/bin/bash

WORK_DIR=$1
if [ -z $WORK_DIR ]; then
    WORK_DIR="/Users/bkim203/Work"
fi

docker run -it --rm \
    -v ~/.m2:/root/.m2 \
    -v ~/.ssh:/root/.ssh \
    -v $WORK_DIR:/work \
    dev

