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
# prerequisites (https://docs.nav2.org/getting_started/index.html)
sudo apt install ros-jazzy-navigation2
sudo apt install ros-jazzy-nav2-bringup
# terminal 1
source ros2_jazzy_rmw_zenoh_ws/install/setup.bash
ros2 run rmw_zenoh_cpp rmw_zenohd
# terminal 2
## Necessary if GPU has some issues
export LIBGL_ALWAYS_SOFTWARE=1
## Use rmw_zenoh
source ros2_jazzy_rmw_zenoh_ws/install/setup.bash
export RMW_IMPLEMENTATION=rmw_zenoh_cpp
## Run navigation2
export TURTLEBOT3_MODEL=waffle
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/opt/ros/jazzy/share/turtlebot3_gazebo/models
ros2 launch nav2_bringup tb3_simulation_launch.py headless:=False
## Run rviz2 and gazebo separately
ros2 launch nav2_bringup rviz_launch.py
ros2 launch nav2_bringup tb3_simulation_launch.py headless:=False use_rviz:=False
## You might need this if using WAYLAND
## https://gazebosim.org/docs/harmonic/troubleshooting/#wayland-issues
QT_QPA_PLATFORM=xcb ros2 launch nav2_bringup tb3_simulation_launch.py headless:=False
```

* Clean the project

```shell
just scripts/ros2-jazzy-rmw-zenoh/clean
```
