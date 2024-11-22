if [ $# -eq 0 ]; then
  echo "You need to provide ROS version, like jazzy, rolling..."
  return
fi

shell=`echo $SHELL | awk -F '/' '{print $NF}'`
rosdistro=${1}

source /opt/ros/${rosdistro}/setup.${shell}
for folder in ros2_${rosdistro}_*_ws; do
    echo "Sourcing $folder/install/local_setup.${shell}"
    source $folder/install/local_setup.${shell}
done

export RMW_IMPLEMENTATION=rmw_zenoh_cpp
#export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
