# Set the shell type
shell=zsh

# RMW_IMPLEMENTATION
#export RMW_IMPLEMENTATION=rmw_zenoh_cpp
#export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
#export RMW_IMPLEMENTATION=rmw_fastrtps_cpp

# ccache configuration
# Refer to https://autowarefoundation.github.io/autoware-documentation/main/how-to-guides/others/advanced-usage-of-colcon/#using-ccache-to-speed-up-recompilation
export CC="/usr/lib/ccache/gcc"
export CXX="/usr/lib/ccache/g++"
export CCACHE_DIR="$HOME/.cache/ccache/"
ccache -s # Show the current cache

if [[ "$PS1" != *"(${ENV_NAME})"* ]]; then
  export PS1="(${ENV_NAME}) $PS1"
fi
