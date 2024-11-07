# ROS 2 Jazzy with iRobot performance

Get the iRobot performance test tool.

## Step

* Build the code

```shell
source /opt/ros/jazzy/setup.bash
# Download the code and dependencies. Then build it.
just scripts/ros2-jazzy/irobot-performance/all

# Option 1: Only build after modifying the code
just scripts/ros2-jazzy/irobot-performance/build

# Option 2: Install dependency at the first time running docker
# if you've already built it before and want to run it directly.
just scripts/ros2-jazzy/irobot-performance/dependency
```

* Usage
  * See the [README](https://github.com/irobot-ros/ros2-performance)
  * Test the topology [mont_blanc](https://github.com/irobot-ros/ros2-performance/blob/rolling/irobot_benchmark/topology/mont_blanc.pdf)

```shell
source ros2_jazzy_irobot_performance_ws/install/local_setup.bash
./ros2_jazzy_irobot_performance_ws/install/irobot_benchmark/lib/irobot_benchmark/irobot_benchmark --topology ros2_jazzy_irobot_performance_ws/install/irobot_benchmark/lib/irobot_benchmark/topology/mont_blanc.json --ipc "off" --time "5" --tracking on --csv-out on
```

* Clean the project

```shell
just scripts/ros2-jazzy/irobot-performance/clean
```
