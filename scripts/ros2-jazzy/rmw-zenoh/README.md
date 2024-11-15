# ROS 2 Jazzy with rmw_zenoh

Able to build rmw_zenoh inside jazzy

## Step

* Build the code

```shell
source /opt/ros/jazzy/setup.bash
# Download the code and dependencies. Then build it.
just scripts/ros2-jazzy/rmw-zenoh/all

# Option 1: Only build after modifying the code
just scripts/ros2-jazzy/rmw-zenoh/build

# Option 2: Install dependency at the first time running docker
# if you've already built it before and want to run it directly.
just scripts/ros2-jazzy/rmw-zenoh/dependency
```

* Test navigation2
  * Use `export LIBGL_ALWAYS_SOFTWARE=1` if GPU has some issues.
  * Disable "Large Text" in Ubuntu to solve fliker issue

```shell
# prerequisites (https://docs.nav2.org/getting_started/index.html)
sudo apt install ros-jazzy-navigation2
sudo apt install ros-jazzy-nav2-bringup
source ros2_rolling_rmw_zenoh_ws/install/local_setup.bash
# Use rmw_zenoh
export RMW_IMPLEMENTATION=rmw_zenoh_cpp
```

```shell
# terminal 1
ros2 run rmw_zenoh_cpp rmw_zenohd

# terminal 2
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
just scripts/ros2-jazzy/rmw-zenoh/clean
```
