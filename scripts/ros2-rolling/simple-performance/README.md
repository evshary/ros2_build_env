# ROS 2 Rolling with simple performance test

This is the examples for testing

## Step

* Build the code

```shell
source /opt/ros/rolling/setup.bash
# Download the code and dependencies. Then build it.
just scripts/ros2-rolling/simple-performance/all

# Only build after modifying the code
just scripts/ros2-rolling/simple-performance/build
```

* Test examples

```shell
source ros2_rolling_simple_examples_ws/install/local_setup.bash
# pong
ros2 run simple_performance pong --ros-args -p reliability:=BEST_EFFORT -p durability:=TRANSIENT_LOCAL -p history:=KEEP_ALL
# ping
ros2 run simple_performance ping --ros-args -p warmup:=5.0 -p size:=32 -p samples:=100 -p rate:=10
# See the https://github.com/ZettaScaleLabs/ros2-simple-performance
```

* Clean the project

```shell
just scripts/ros2-rolling/simple-performance/clean
```
