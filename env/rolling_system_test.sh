CURRENT_PATH=$(dirname "$(realpath "$0")")
export ENV_NAME=$(basename "$0" | cut -d '.' -f 1)
source ${CURRENT_PATH}/common.sh

rosdistro=rolling

source /opt/ros/${rosdistro}/setup.${shell}
source ros2_${rosdistro}_rmw_zenoh_ws/install/local_setup.${shell}
source ros2_${rosdistro}_system_test_ws/install/local_setup.${shell}
