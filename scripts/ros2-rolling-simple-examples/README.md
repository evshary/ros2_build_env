# ROS 2 Rolling with simple examples

This is the examples for testing

## Step

* Build the code

```shell
source /opt/ros/rolling/setup.bash
# Download the code and dependencies. Then build it.
just scripts/ros2-rolling-simple-examples/all

# Option 1: Only build after modifying the code
just scripts/ros2-rolling-simple-examples/build

# Option 2: Install dependency at the first time running docker
# if you've already built it before and want to run it directly.
just scripts/ros2-rolling-simple-examples/dependency
```

* Test examples

```shell
# Service
## C++ server
ros2 run cpp_service_client example_server
## C++ client
ros2 run cpp_service_client example_client
## Python server
ros2 run py_service_client add_two_ints_server
## Python client
ros2 run py_service_client add_two_ints_client
```

* Clean the project

```shell
just scripts/ros2-rolling-simple-examples/clean
```
