# ROS 2 Rolling system test

The environment to run ros2 system test

## Step

* Build the code
  * Note you might need to build rmw_zenoh first if you want to test rmw_zenoh

```shell
source /opt/ros/rolling/setup.bash
# Download the code and dependencies. Then build it.
just scripts/ros2-rolling/system-test/all

# Option 1: Only build after modifying the code
just scripts/ros2-rolling/system-test/build

# Option 2: Install dependency at the first time running docker
# if you've already built it before and want to run it directly.
just scripts/ros2-rolling/system-test/dependency
```

* Test

```shell
just scripts/ros2-rolling/system-test/test
```

* Clean the project

```shell
just scripts/ros2-rolling/system-test/clean
```
