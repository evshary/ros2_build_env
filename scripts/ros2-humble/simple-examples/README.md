# ROS 2 Humble with simple examples

This is the examples for testing

## Step

* Build the code

```shell
source /opt/ros/humble/setup.bash
# Download the code and dependencies. Then build it.
just scripts/ros2-humble/simple-examples/all

# Only build after modifying the code
just scripts/ros2-humble/simple-examples/build
```

* Test examples

```shell
source ros2_humble_simple_examples_ws/install/local_setup.bash
# See the https://github.com/evshary/ros2-simple-examples
```

* Debug
  * Note we can't have both address and undefined at the same time due to [the bug](https://stackoverflow.com/questions/60774638/logging-control-for-address-sanitizer-plus-undefined-behavior-sanitizer)

```shell
# valgrind
just scripts/ros2-humble/simple-examples/debug
valgrind --leak-check=full --log-file=valgrind.log ros2 run simple_examples_cpp qos_pub

# ASAN
# Ignore new_delete_type_mismatch due to the issue
# https://github.com/ros2/rclcpp/issues/2220
export ASAN_OPTIONS=new_delete_type_mismatch=0:halt_on_error=0:log_path=asan.log
just scripts/ros2-humble/simple-examples/debug_asan
ros2 run simple_examples_cpp qos_pub

# UBSAN
export UBSAN_OPTIONS=halt_on_error=0:print_stacktrace=1:log_path=ubsan.log 
just scripts/ros2-humble/simple-examples/debug_ubsan
ros2 run simple_examples_cpp qos_pub

# GDB in terminal
# Refer to https://juraph.com/miscellaneous/ros2_and_gdb/

# GDB in vscode
# Need to run in container
# Modify .vscode/launch.json
# Press F5
```

* Clean the project

```shell
just scripts/ros2-humble/simple-examples/clean
```
