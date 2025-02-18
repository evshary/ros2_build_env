CURRENT_PATH=$(dirname "$(realpath "$0")")
export ENV_NAME=$(basename "$0" | cut -d '.' -f 1)
source ${CURRENT_PATH}/common.sh
# Force using CycloneDDS
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

rosdistro=humble

source /opt/ros/${rosdistro}/setup.${shell}
source autoware_${rosdistro}_202502_ws/install/local_setup.${shell}
