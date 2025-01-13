CURRENT_PATH=$(dirname "$(realpath "$0")")
source ${CURRENT_PATH}/common.sh

if [ $# -eq 0 ]; then
  echo "You need to provide ROS version, like jazzy, rolling..."
  return
fi

rosdistro=${1}

source /opt/ros/${rosdistro}/setup.${shell}
for folder in ros2_${rosdistro}_*_ws; do
    echo "Sourcing $folder/install/local_setup.${shell}"
    source $folder/install/local_setup.${shell}
done

PS1=$PS1"(${rosdistro}) "
