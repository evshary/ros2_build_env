# ROS 2 Rolling irobot test

The environment to run ros2 irobot test

## Step

* Build the code
  * Note you might need to build rmw_zenoh first if you want to test rmw_zenoh

```shell
source /opt/ros/rolling/setup.bash
# Download the code and dependencies. Then build it.
just scripts/ros2-rolling/irobot-test/all

# Only build after modifying the code
just scripts/ros2-rolling/irobot-test/build
```

* Test

```shell
just scripts/ros2-rolling/irobot-test/test
```

* Clean the project

```shell
just scripts/ros2-rolling/irobot-test/clean
```
