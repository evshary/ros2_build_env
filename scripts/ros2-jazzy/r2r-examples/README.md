# ROS 2 jazzy with r2r examples

This is the examples for testing

## Step

* Build the code

```shell
source /opt/ros/jazzy/setup.bash
# Download the code and dependencies. Then build it.
just scripts/ros2-jazzy/r2r-examples/all

# Only build after modifying the code
just scripts/ros2-jazzy/r2r-examples/build
```

* Test examples

```shell
source ros2_jazzy_r2r_examples_ws/install/local_setup.bash
# See the https://github.com/evshary/r2r-examples
```

* Clean the project

```shell
just scripts/ros2-jazzy/r2r-examples/clean
```
