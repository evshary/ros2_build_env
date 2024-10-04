#!/usr/bin/env bash
set -e

echo "test ${DOCKER_IMAGE}"

if [ ! "$(docker images -q ${DOCKER_IMAGE})" ]; then
    echo "${DOCKER_IMAGE} does not exist. Creating..."
    docker build --no-cache \
                 --build-arg UID=`id -u` \
                 --build-arg GID=`id -g` \
                 --build-arg USERNAME=${USER} \
                 -f ${DOCKER_FILE} -t ${DOCKER_IMAGE} .
fi

xhost +local:
docker run --rm -it --network host --privileged -v $(pwd):$HOME/workspace --workdir $HOME/workspace \
    -e QT_X11_NO_MITSHM=1 -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /etc/localtime:/etc/localtime:ro \
    ${DOCKER_IMAGE}
