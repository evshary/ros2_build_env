# ROS 2 Rolling navigation2

Download navigation2 source code and build.

## Step

* Download and build

```shell
source /opt/ros/rolling/setup.bash
# Download the code and dependencies. Then build it.
just scripts/ros2-rolling-nav2/all

# Option 1: Only build after modifying the code
just scripts/ros2-rolling-nav2/build

# Option 2: Install dependency at the first time running docker
# if you've already built it before and want to run it directly.
just scripts/ros2-rolling-nav2/dependency
```

* Update `.vscode/c_cpp_properties.json`

  * `"compileCommands": "./ros2_rolling_nav2_ws/build/compile_commands.json",`

* If you want to debug the ROS node, add `prefix=['xterm -e gdb -ex run --args'],` to the launch file.

  * Refer to [nav2 debug tutorial](https://docs.nav2.org/tutorials/docs/get_backtrace.html#from-nav2-bringup) and [Using GDB with ROS2, a reference](https://juraph.com/miscellaneous/ros2_and_gdb/)

* Test the code

```shell
# terminal 1
ros2 run rmw_zenoh_cpp rmw_zenohd
# terminal 2
export RMW_IMPLEMENTATION=rmw_zenoh_cpp
just scripts/ros2-rolling-nav2/test
```

* Clean the project

```shell
just scripts/ros2-rolling-nav2/clean
```
