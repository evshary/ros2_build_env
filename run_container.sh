#!/usr/bin/env bash
set -e

if [ -z "${DOCKER_IMAGE}" ]; then
    echo "Please source the container env first"
    echo "For example:"
    echo "  source containers/ros2-jazzy/env.sh"
    echo "  source containers/ros2-rolling/env.sh"
    exit 1
fi

CONTAINER_NAME=${DOCKER_IMAGE}-container

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

# Check the status of the container (We need to ignore errors here)
set +e
CONTAINER_STATUS=$(docker inspect --format='{{.State.Status}}' $CONTAINER_NAME 2>/dev/null)
set -e

if [ "$CONTAINER_STATUS" == "exited" ]; then
    echo "Container '$CONTAINER_NAME' is stopped. Starting the container..."
    docker start $CONTAINER_NAME
    docker exec -it ${CONTAINER_NAME} zsh
elif [ "$CONTAINER_STATUS" == "running" ]; then
    echo "Container '$CONTAINER_NAME' is already running. Attaching to the container..."
    docker exec -it ${CONTAINER_NAME} zsh
elif [ "$CONTAINER_STATUS" == "" ]; then
    echo "Container '$CONTAINER_NAME' does not exist. Creating and running the container..."
    docker run -it --network host --privileged --name ${CONTAINER_NAME} \
        -v $(pwd):/workspaces/ros2_build_env --workdir /workspaces/ros2_build_env \
        -e QT_X11_NO_MITSHM=1 -e DISPLAY=${DISPLAY} \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v /etc/localtime:/etc/localtime:ro \
        ${DOCKER_IMAGE}
else
    echo "Unhandled state '$CONTAINER_STATUS' for container '$CONTAINER_NAME'."
fi
