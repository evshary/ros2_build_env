usage:
    @echo "Usage: just scripts/ros2-<version>/<repo>/<receipe>"
    @echo "       just scripts/ros2-<version>/<receipe> <folder> <repo url>"

clean_docker:
    docker rm -f ${DOCKER_IMAGE}-container
    docker rmi ${DOCKER_IMAGE}

clean:
    rm -rf *_ws
    rm -rf *.log
