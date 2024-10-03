# ROS 2 Jazzy GUI

Able to run GUI ROS 2 program in containers.

## Step

* Build the code

```shell
source /opt/ros/jazzy/setup.bash
# Download the code and dependencies. Then build it.
just scripts/ros2-jazzy-rmw-zenoh/all

# Option 1: Only build after modifying the code
just scripts/ros2-jazzy-rmw-zenoh/build

# Option 2: Install dependency at the first time running docker
# if you've already built it before and want to run it directly.
just scripts/ros2-jazzy-rmw-zenoh/dependency
```

* Test navigation2

```shell
# terminal 1
source ros2_jazzy_rmw_zenoh_ws/install/setup.bash
ros2 run rmw_zenoh_cpp rmw_zenohd
# terminal 2
source ros2_jazzy_rmw_zenoh_ws/install/setup.bash
export TURTLEBOT3_MODEL=waffle
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/opt/ros/jazzy/share/turtlebot3_gazebo/models
export LIBGL_ALWAYS_SOFTWARE=1 # Necessary if GPU has some issues
export RMW_IMPLEMENTATION=rmw_zenoh_cpp
ros2 launch nav2_bringup tb3_simulation_launch.py headless:=False
```

* Clean the project

```shell
just scripts/ros2-jazzy-rmw-zenoh/clean
```
