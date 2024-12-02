#!/bin/bash
set -x

source /opt/ros/"${ROS_DISTRO}"/setup.bash
source ros2_"${ROS_DISTRO}"_nav2_ws/install/local_setup.bash

ros2 launch nav2_bringup rviz_launch.py
