#!/bin/bash

# Default values for registry
PORT=5000
NAME="registry"

# Parse options
usage() {
    echo "Usage: $0"
    echo "    -h : shows the usage"
    echo "    -n <registry-name> : optional. \"registry\" is the default name."
    echo "    -p <port-number> : optional. \"5000\" is the default port number."
    exit 1
}

while getopts ":n:p:h" o;
do
    case "${o}" in
        h)
            usage
            ;;
        n)
            REGISTRY_NAME=${OPTARG}
            ;;
        p)
            PORT_NUMBER=${OPTARG}
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


# Run a docker container of registry:2
echo "Run a registry container. name=$NAME, port=$PORT"
docker run \
    -d \
    -e REGISTRY_STORAGE_DELETE_ENABLED=true \
    -p $PORT:5000 \
    --name $NAME \
    registry:2
