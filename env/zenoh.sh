export RMW_IMPLEMENTATION=rmw_zenoh_cpp

# Configuration for Zenoh
export ZENOH_ROUTER_CONFIG_URI=ros2_${rosdistro}_rmw_zenoh_ws/src/rmw_zenoh/rmw_zenoh_cpp/config/DEFAULT_RMW_ZENOH_ROUTER_CONFIG.json5
export ZENOH_SESSION_CONFIG_URI=ros2_${rosdistro}_rmw_zenoh_ws/src/rmw_zenoh/rmw_zenoh_cpp/config/DEFAULT_RMW_ZENOH_SESSION_CONFIG.json5
#export ZENOH_SHM_ENABLED=true
#export ZENOH_SHM_MESSAGE_SIZE_THRESHOLD=1

source ros2_${rosdistro}_rmw_zenoh_ws/install/local_setup.${shell}
