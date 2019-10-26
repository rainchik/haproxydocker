#!/bin/bash
#prepare
TAG=`date +%s`
TAG="1572092552"
NAME="haproxy"
export TAG=${TAG}
export NAME=${NAME}

#Build docker image
echo "===Deploy=== Build docker image ${NAME}-${TAG}"
docker build -t ${NAME}-${TAG} -f Dockerfile ./

#create docker network
if [ ! "$(docker network ls --filter name=${NAME}-${TAG} -q)" ]; then
  echo "===Deploy=== Docker network ${NAME}-${TAG} doesn't exist"
  docker network create ${NAME}-${TAG}
else
  echo "===Deploy=== Docker network ${NAME}-${TAG} already exist. Skipping creation network..."
fi

echo "===Deploy=== Start services from image ${NAME}-${TAG}"
docker-compose up -d
