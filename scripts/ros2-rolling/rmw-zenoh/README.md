# ROS 2 Rolling with rmw_zenoh

Able to build rmw_zenoh inside rolling

## Step

* Build the code

```shell
source /opt/ros/rolling/setup.bash
# Download the code and dependencies. Then build it.
just scripts/ros2-rolling/rmw-zenoh/all

# Option 1: Only build after modifying the code
just scripts/ros2-rolling/rmw-zenoh/build

# Option 2: Install dependency at the first time running docker
# if you've already built it before and want to run it directly.
just scripts/ros2-rolling/rmw-zenoh/dependency
```

* Clean the project

```shell
just scripts/ros2-rolling/rmw-zenoh/clean
```
