# ROS 2 Jazzy with rmw_zenoh

Able to build rmw_zenoh inside jazzy

## Step

* Build the code

```shell
source /opt/ros/jazzy/setup.bash
# Download the code and dependencies. Then build it.
just scripts/ros2-jazzy/rmw-zenoh/all

# Option 1: Only build after modifying the code
just scripts/ros2-jazzy/rmw-zenoh/build

# Option 2: Install dependency at the first time running docker
# if you've already built it before and want to run it directly.
just scripts/ros2-jazzy/rmw-zenoh/dependency
```

* Test navigation2
  * Install navigation2

    ```shell
    # prerequisites (https://docs.nav2.org/getting_started/index.html)
    sudo apt install ros-jazzy-navigation2
    sudo apt install ros-jazzy-nav2-bringup
    ```

  * Follow the step in [nav2 README.md](../nav2/README.md)

* Clean the project

```shell
just scripts/ros2-jazzy/rmw-zenoh/clean
```
