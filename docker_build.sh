#!/bin/bash

set -e
cd $WORKSPACE/3.0
git checkout $VERSION
VERSION_NAME=${VERSION#release\/}

sudo docker build -t musashi/redis:$VERSION_NAME .
sudo docker tag musashi/redis:$VERSION_NAME $DOCKER_BASE_URL/musashi/redis:${VERSION_NAME}_${BUILD_NUMBER}
sudo docker push $DOCKER_BASE_URL/musashi/redis:${VERSION_NAME}_${BUILD_NUMBER}
