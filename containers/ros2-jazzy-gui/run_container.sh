#!/bin/bash

DOCKER_IMAGE=ros2-jazzy-gui
DOCKER_FILE=containers/ros2-jazzy-gui/Dockerfile

if [ ! "$(docker images -q ${DOCKER_IMAGE})" ]; then
    echo "${DOCKER_IMAGE} does not exist. Creating..."
    docker build --build-arg UID=`id -u` \
                 --build-arg GID=`id -g` \
                 --build-arg USERNAME=${USER} \
                 -f ${DOCKER_FILE} -t ${DOCKER_IMAGE} .
fi

#rocker --network host --privileged --x11 --user --volume $(pwd):$HOME/workspace -- ${DOCKER_IMAGE}
xhost +local:
docker run --rm -it --network host  --privileged -v $(pwd):$HOME/workspace --workdir $HOME/workspace \
    -e QT_X11_NO_MITSHM=1 -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /etc/localtime:/etc/localtime:ro \
    ${DOCKER_IMAGE}
