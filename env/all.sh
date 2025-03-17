for folder in ros2_${rosdistro}_*_ws; do
    echo "Sourcing $folder/install/local_setup.${shell}"
    source $folder/install/local_setup.${shell}
done