# ROS 2 Jazzy GUI

Able to run GUI ROS 2 program in containers.

## Prerequisites

* Install rocker first.

## Step

* Run docker container

```shell
./jazzy_gui/run_container.sh
```

* Run navigation2

```shell
export TURTLEBOT3_MODEL=waffle
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/opt/ros/jazzy/share/turtlebot3_gazebo/models
export LIBGL_ALWAYS_SOFTWARE=1 # Necessary if GPU has some issues
ros2 launch nav2_bringup tb3_simulation_launch.py headless:=False
```
