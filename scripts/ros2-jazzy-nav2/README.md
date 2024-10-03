# ROS 2 Jazzy navigation2

Dowload navigation2 source code and build.

## Step

* Download and build

```shell
source /opt/ros/jazzy/setup.bash
# Download the code and dependencies. Then build it.
just scripts/ros2-jazzy-nav2/all

# Option 1: Only build after modifying the code
just scripts/ros2-jazzy-rmw-zenoh/build

# Option 2: Install dependency at the first time running docker
# if you've already built it before and want to run it directly.
```

* Update `.vscode/c_cpp_properties.json`

  * `"compileCommands": "./ros2_jazzy_nav2_ws/build/compile_commands.json",`

* Clean the project

```shell
just scripts/ros2-jazzy-nav2/clean
```
