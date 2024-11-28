# ROS 2 Rolling with simple examples

This is the examples for testing

## Step

* Build the code

```shell
source /opt/ros/rolling/setup.bash
# Download the code and dependencies. Then build it.
just scripts/ros2-rolling/simple-examples/all

# Option 1: Only build after modifying the code
just scripts/ros2-rolling/simple-examples/build

# Option 2: Install dependency at the first time running docker
# if you've already built it before and want to run it directly.
just scripts/ros2-rolling/simple-examples/dependency
```

* Test examples

```shell
source ros2_rolling_simple_examples_ws/install/local_setup.bash
# See the https://github.com/evshary/ros2-simple-examples
```

* Debug
  * Note we can't have both address and undefined at the same time due to [the bug](https://stackoverflow.com/questions/60774638/logging-control-for-address-sanitizer-plus-undefined-behavior-sanitizer)

```shell
# valgrind
just scripts/ros2-rolling/simple-examples/debug
valgrind --leak-check=full --log-file=valgrind.log ros2 run simple_examples_cpp qos_pub

# ASAN
# Ignore new_delete_type_mismatch due to the issue
# https://github.com/ros2/rclcpp/issues/2220
export ASAN_OPTIONS=new_delete_type_mismatch=0:halt_on_error=0:log_path=asan.log
just scripts/ros2-rolling/simple-examples/debug_asan
ros2 run simple_examples_cpp qos_pub

# UBSAN
export UBSAN_OPTIONS=halt_on_error=0:print_stacktrace=1:log_path=ubsan.log 
just scripts/ros2-rolling/simple-examples/debug_ubsan
ros2 run simple_examples_cpp qos_pub

# GDB
# Refer to https://juraph.com/miscellaneous/ros2_and_gdb/
```

* Clean the project

```shell
just scripts/ros2-rolling/simple-examples/clean
```
