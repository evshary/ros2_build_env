# ROS 2 Rolling irobot performance

The environment to run irobot performance test

## Step

* Build the code

```shell
source /opt/ros/rolling/setup.bash
# Download the code and dependencies. Then build it.
just scripts/ros2-rolling/irobot-performance/all

# Only build after modifying the code
just scripts/ros2-rolling/irobot-performance/build
```

* Tes
  * See the [README](https://github.com/irobot-ros/ros2-performance)
  * Test the topology [mont_blanc](https://github.com/irobot-ros/ros2-performance/blob/rolling/irobot_benchmark/topology/mont_blanc.pdf)

```shell
just scripts/ros2-rolling/irobot-performance/test
```

* Clean the project

```shell
just scripts/ros2-rolling/irobot-performance/clean
```
