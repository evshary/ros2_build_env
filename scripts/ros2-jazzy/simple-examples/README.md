# ROS 2 Jazzy with simple examples

This is the examples for testing

## Step

* Build the code

```shell
source /opt/ros/jazzy/setup.bash
# Download the code and dependencies. Then build it.
just scripts/ros2-jazzy/simple-examples/all

# Only build after modifying the code
just scripts/ros2-jazzy/simple-examples/build
```

* Test examples

```shell
source ros2_jazzy_simple_examples_ws/install/local_setup.bash
# See the https://github.com/evshary/ros2-simple-examples
```

* Clean the project

```shell
just scripts/ros2-jazzy/simple-examples/clean
```
