CURRENT_PATH=$(dirname "$(realpath "$0")")
source ${CURRENT_PATH}/common.sh

rosdistro=rolling

source /opt/ros/${rosdistro}/setup.${shell}
source ros2_${rosdistro}_rmw_zenoh_ws/install/local_setup.${shell}
source ros2_${rosdistro}_system_test_ws/install/local_setup.${shell}
