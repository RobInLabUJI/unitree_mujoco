#!/usr/bin/env sh

BASE_IMAGE=unitree_mujoco_base
IMAGE=unitree_mujoco

docker build --no-cache -t $BASE_IMAGE .

if [ $(docker images -q "$IMAGE") ]; then
  docker image rm $IMAGE
fi

