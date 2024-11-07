#!/usr/bin/env bash
set -e

CONTAINER_NAME=${DOCKER_IMAGE}-container

echo "Running ${DOCKER_IMAGE}"

if [ ! "$(docker images -q ${DOCKER_IMAGE})" ]; then
    echo "${DOCKER_IMAGE} does not exist. Creating..."
    docker build --no-cache \
                 --build-arg UID=`id -u` \
                 --build-arg GID=`id -g` \
                 --build-arg USERNAME=${USER} \
                 -f ${DOCKER_FILE} -t ${DOCKER_IMAGE} .
fi

if [[ -z "${DISPLAY}" ]]; then
    echo "The terminal doesn't support GUI."
else
    xhost +local:
fi

if [ ! "$(docker ps -a -q -f name=${CONTAINER_NAME})" ]; then
    echo "Running ${CONTAINER_NAME}"
    docker run --rm -it --network host --privileged --name ${CONTAINER_NAME} \
        -v $(pwd):/workspaces/ros2_build_env --workdir /workspaces/ros2_build_env \
        -e QT_X11_NO_MITSHM=1 -e DISPLAY=${DISPLAY} \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v /etc/localtime:/etc/localtime:ro \
        ${DOCKER_IMAGE}
else
    echo "Enter the existing container ${CONTAINER_NAME}"
    docker exec -it ${CONTAINER_NAME} bash
fi
