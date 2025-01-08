shell=`echo $SHELL | awk -F '/' '{print $NF}'`
rosdistro=rolling

source /opt/ros/${rosdistro}/setup.${shell}
source ros2_${rosdistro}_rmw_zenoh_ws/install/local_setup.${shell}
source ros2_${rosdistro}_system_test_ws/install/local_setup.${shell}

export RMW_IMPLEMENTATION=rmw_zenoh_cpp

# Configuration for Zenoh
#export ZENOH_SESSION_CONFIG_URI=xxxx
#export ZENOH_ROUTER_CONFIG_URI=xxxx
#export ZENOH_SHM_ENABLED=true
#export ZENOH_SHM_MESSAGE_SIZE_THRESHOLD=1
