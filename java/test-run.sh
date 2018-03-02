#!/bin/bash

docker run \
    -it \
    --rm \
    -v ~/.m2:/root/.m2 \
    -v /Users/bkim203/Work/source/github-comcast/databig/job-control-manager:/work \
    -p 8081:8081 \
    nunojun/jdk9-maven-centos7 \
    /bin/bash -c "mvn --version && cd /work && mvn clean spring-boot:run -Dspring.profiles.active=local -Djasypt.encryptor.password=JobControlManagerLocal"
