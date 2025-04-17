export rosdistro=${ROS_DISTRO}
export shell=zsh

# ccache configuration
# Refer to https://autowarefoundation.github.io/autoware-documentation/main/how-to-guides/others/advanced-usage-of-colcon/#using-ccache-to-speed-up-recompilation
export CC="/usr/lib/ccache/gcc"
export CXX="/usr/lib/ccache/g++"
export CCACHE_DIR="$HOME/.cache/ccache/"
ccache -s # Show the current cache

source /opt/ros/${rosdistro}/setup.${shell}
