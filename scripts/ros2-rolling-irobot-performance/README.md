# ROS 2 Rolling with iRobot performance

Get the iRobot performance test tool.

## Step

* Build the code

```shell
source /opt/ros/rolling/setup.bash
# Download the code and dependencies. Then build it.
just scripts/ros2-rolling-irobot-performance/all

# Option 1: Only build after modifying the code
just scripts/ros2-rolling-irobot-performance/build

# Option 2: Install dependency at the first time running docker
# if you've already built it before and want to run it directly.
just scripts/ros2-rolling-irobot-performance/dependency
```

* Usage
  * See the [README](https://github.com/irobot-ros/ros2-performance)

* Clean the project

```shell
just scripts/ros2-rolling-irobot-performance/clean
```