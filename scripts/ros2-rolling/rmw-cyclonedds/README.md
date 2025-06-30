# ROS 2 Rolling with rmw_cyclonedds

Able to build rmw_cyclonedds inside rolling

## Step

* Build the code

```shell
source /opt/ros/rolling/setup.bash
# Download the code and dependencies. Then build it.
just scripts/ros2-rolling/rmw-cyclonedds/all

# Only build after modifying the code
just scripts/ros2-rolling/rmw-cyclonedds/build
```

* Clean the project

```shell
just scripts/ros2-rolling/rmw-cyclonedds/clean
```
