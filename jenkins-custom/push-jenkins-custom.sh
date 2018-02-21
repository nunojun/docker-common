#!/bin/bash

#!/bin/bash

IMAGE_NAME="jenkins-custom"
TAG="0.1"
REGISTRY_NAME="localhost:5000"

# TODO: Modify to receive arguments

if [ "" == `docker images | grep "$IMAGE_NAME" | grep "$TAG"` ]; then
    echo "There is no local image - $IMAGE_NAME:$TAG"
    exit 1
fi

docker tag $IMAGE_NAME:$TAG $REGISTRY_NAME/$IMAGE_NAME:$TAG \
&& docker push $REGISTRY_NAME/$IMAGE_NAME:$TAG

# TODO: Delete the local image??
