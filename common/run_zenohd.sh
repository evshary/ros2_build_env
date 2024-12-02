#!/bin/bash
set -x

source /opt/ros/"${ROS_DISTRO}"/setup.bash
source ros2_"${ROS_DISTRO}"_rmw_zenoh_ws/install/local_setup.bash
export RMW_IMPLEMENTATION=rmw_zenoh_cpp
RUST_LOG=z=debug ros2 run rmw_zenoh_cpp rmw_zenohd
