# ROS 2 Jazzy GUI

Able to run GUI ROS 2 program in containers.

## Step

* Run docker container

```shell
./containers/ros2-jazzy-gui/run_container.sh
```

* Build the code

```shell
just scripts/ros2-jazzy-rmw-zenoh/all
```

* Test navigation2

```shell
# terminal 1
ros2 run rmw_zenoh_cpp rmw_zenohd
# terminal 2
export TURTLEBOT3_MODEL=waffle
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/opt/ros/jazzy/share/turtlebot3_gazebo/models
export LIBGL_ALWAYS_SOFTWARE=1 # Necessary if GPU has some issues
export RMW_IMPLEMENTATION=rmw_zenoh_cpp
ros2 launch nav2_bringup tb3_simulation_launch.py headless:=False
```
