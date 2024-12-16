# ROS 2 Rolling with rmw_zenoh

Able to build rmw_zenoh inside rolling

## Step

* Build the code

```shell
source /opt/ros/rolling/setup.bash
# Download the code and dependencies. Then build it.
just scripts/ros2-rolling/rmw-zenoh/all

# Only build after modifying the code
just scripts/ros2-rolling/rmw-zenoh/build
```

* Clean the project

```shell
just scripts/ros2-rolling/rmw-zenoh/clean
```
