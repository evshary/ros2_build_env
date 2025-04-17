# ROS 2 Humble with rmw_zenoh

Able to build rmw_zenoh inside humble

## Step

* Build the code

```shell
source /opt/ros/humble/setup.bash
# Download the code and dependencies. Then build it.
just scripts/ros2-humble/rmw-zenoh/all

# Only build after modifying the code
just scripts/ros2-humble/rmw-zenoh/build
```

* Test navigation2
  * Install navigation2

    ```shell
    # prerequisites (https://docs.nav2.org/getting_started/index.html)
    sudo apt install ros-humble-navigation2
    sudo apt install ros-humble-nav2-bringup
    ```

  * Follow the step in [nav2 README.md](../nav2/README.md)

* Clean the project

```shell
just scripts/ros2-humble/rmw-zenoh/clean
```
