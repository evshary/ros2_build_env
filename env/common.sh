# Set the shell type
shell=`echo $SHELL | awk -F '/' '{print $NF}'`

# RMW_IMPLEMENTATION
export RMW_IMPLEMENTATION=rmw_zenoh_cpp
#export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
#export RMW_IMPLEMENTATION=rmw_fastrtps_cpp

# Configuration for Zenoh
#export ZENOH_SESSION_CONFIG_URI=xxxx
#export ZENOH_ROUTER_CONFIG_URI=xxxx
#export ZENOH_SHM_ENABLED=true
#export ZENOH_SHM_MESSAGE_SIZE_THRESHOLD=1
