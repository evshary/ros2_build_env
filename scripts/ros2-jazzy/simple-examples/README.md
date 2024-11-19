# ROS 2 Jazzy with simple examples

This is the examples for testing

## Step

* Build the code

```shell
source /opt/ros/jazzy/setup.bash
# Download the code and dependencies. Then build it.
just scripts/ros2-jazzy/simple-examples/all

# Option 1: Only build after modifying the code
just scripts/ros2-jazzy/simple-examples/build

# Option 2: Install dependency at the first time running docker
# if you've already built it before and want to run it directly.
just scripts/ros2-jazzy/simple-examples/dependency
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
