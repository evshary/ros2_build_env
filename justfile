usage:
    @echo "Usage: just scripts/ros2-<version>/<repo>/<receipe>"
    @echo "       just scripts/ros2-<version>/<receipe> <folder> <repo url>"

clean:
    rm -rf *_ws
    rm -rf *.log
