#!/bin/bash

# Default values for registry-web
REG_NAME="registry"
REG_HOSTNAME="localhost"
REG_PORT=5000
REG_WEB_NAME="registry-web"
REG_WEB_PORT=5001

# Parse options
usage() {
    echo "Usage: $0"
    echo "    -h : shows the usage"
    echo "    -n <registry-web-name> : optional. \"registry-web\" is the default name."
    echo "    -p <registry-web-port-number> : optional. \"5001\" is the default port number."
    echo "    -r <registry-name> : optional. \"registry\" is the default name."
    echo "    -s <registry-hostname> : optional. \"localhost\" is the default hostname."
    echo "    -t <registry-port> : optional. \"5001\" is the default."
    exit 1
}

while getopts ":n:p:r:s:t:h" o;
do
    case "${o}" in
        h)
            usage
            ;;
        n)
            REG_WEB_NAME=${OPTARG}
            ;;
        p)
            REG_WEB_PORT=${OPTARG}
            ;;
        r)
            REG_NAME=${OPTARG}
            ;;
        s)
            REG_HOSTNAME=${OPTARG}
            ;;
        t)
            REG_PORT=${OPTARG}
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

echo "Run a registry-web container.."
echo "registry name: $REG_NAME"
echo "registry port: $REG_PORT"
echo "registry hostname: $REG_HOSTNAME"
echo "registry-web name: $REG_WEB_NAME"
echo "registry-web port: $REG_WEB_PORT"

docker run \
    -it \
    -d \
    -p $REG_WEB_PORT:8080 \
    --name $REG_WEB_NAME \
    --link $REG_NAME \
    -e REGISTRY_NAME=$REG_HOSTNAME:$REG_PORT \
    -e REGISTRY_READONLY=false \
    -e REGISTRY_URL=http://$REG_NAME:$REG_PORT/v2 \
    hyper/docker-registry-web
