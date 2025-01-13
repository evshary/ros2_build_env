CURRENT_PATH=$(dirname "$(realpath "$0")")
source ${CURRENT_PATH}/common.sh

rosdistro=rolling

source /opt/ros/${rosdistro}/setup.${shell}
source ros2_${rosdistro}_rmw_zenoh_ws/install/local_setup.${shell}
source ros2_${rosdistro}_irobot_performance_ws/install/local_setup.${shell}

PS1=$PS1"($(basename "$0" | cut -d '.' -f 1)) "
