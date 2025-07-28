#!/bin/bash
set -x

source /opt/ros/"${ROS_DISTRO}"/setup.bash
source ros2_"${ROS_DISTRO}"_nav2_ws/install/local_setup.bash

## Only required the version before ROS 2 Iron
#export TURTLEBOT3_MODEL=waffle
#export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/opt/ros/${ROS_DISTRO}/share/turtlebot3_gazebo/models

ros2 launch nav2_bringup tb3_simulation_launch.py headless:=False use_rviz:=False 2>&1 | tee nav2_tb3.log

## You might need this if using WAYLAND
## https://gazebosim.org/docs/harmonic/troubleshooting/#wayland-issues
#QT_QPA_PLATFORM=xcb ros2 launch nav2_bringup tb3_simulation_launch.py headless:=False &> nav2.log
