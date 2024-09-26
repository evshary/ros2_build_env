#!/bin/bash

DOCKER_IMAGE=jazzy-gui
DOCKER_FILE=jazzy_gui/Dockerfile

if [ ! "$(docker images -q ${DOCKER_IMAGE})" ]; then
    echo "${DOCKER_IMAGE} does not exist. Creating..."
    docker build -f ${DOCKER_FILE} -t ${DOCKER_IMAGE} .
fi

rocker --network host --privileged --x11 --user --volume $(pwd):$HOME/workspace -- ${DOCKER_IMAGE}
