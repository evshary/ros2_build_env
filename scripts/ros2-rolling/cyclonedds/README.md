# ROS 2 Rolling with CycloneDDS

Able to build cyclonedds inside rolling

**Note that we shouldn't source ROS 2 environment while building CycloneDDS.**
It will conflict with the CycloneDDS binaries in the ROS 2 rolling.

## Step

* Build the code

```shell
source /opt/ros/rolling/setup.bash
# Download the code and dependencies. Then build it.
just scripts/ros2-rolling/cyclonedds/all

# Only build after modifying the code
just scripts/ros2-rolling/cyclonedds/build
```

* Clean the project

```shell
just scripts/ros2-rolling/cyclonedds/clean
```
