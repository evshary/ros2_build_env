# ROS 2 Rolling navigation2

Download navigation2 source code and build.

## Step

* Download and build

```shell
source /opt/ros/rolling/setup.bash
# Download the code and dependencies. Then build it.
just scripts/ros2-rolling/nav2/all

# Option 1: Only build after modifying the code
just scripts/ros2-rolling/nav2/build

# Option 2: Install dependency at the first time running docker
# if you've already built it before and want to run it directly.
just scripts/ros2-rolling/nav2/dependency
```

* Update `.vscode/c_cpp_properties.json`

  * `"compileCommands": "./ros2_rolling_nav2_ws/build/compile_commands.json",`

* If you want to debug the ROS node:
  * Install xterm and gdb: `sudo apt install xterm gdb`
  * Add `prefix=['xterm -e gdb -ex run --args'],` to the launch file.
    * Refer to [nav2 debug tutorial](https://docs.nav2.org/tutorials/docs/get_backtrace.html#from-nav2-bringup) and [Using GDB with ROS2, a reference](https://juraph.com/miscellaneous/ros2_and_gdb/)

* Test the code

```shell
# terminal 1
ros2 run rmw_zenoh_cpp rmw_zenohd
# terminal 2
export RMW_IMPLEMENTATION=rmw_zenoh_cpp
just scripts/ros2-rolling/nav2/test
```

* Clean the project

```shell
just scripts/ros2-rolling/nav2/clean
```

## Run navigation2

* Before tests
  * Use `export LIBGL_ALWAYS_SOFTWARE=1` if GPU has some issues.
  * Disable "Large Text" in Ubuntu to solve fliker issue
  * Install dependencies if you run a clean container

    ```shell
    just scripts/ros2-rolling/rmw-zenoh/dependency
    just scripts/ros2-rolling/nav2/dependency
    ```

* Run zenohd in terminal 1

```shell
# terminal 1
./common/run_zenohd.sh
```

* Run nav2 & rviz2

```shell
# terminal 2
## Run navigation2
ros2 launch nav2_bringup tb3_simulation_launch.py headless:=False
### TB4
ros2 launch nav2_bringup tb4_simulation_launch.py headless:=False

## Run rviz2 and gazebo separately
ros2 launch nav2_bringup rviz_launch.py &> rviz2.log
ros2 launch nav2_bringup tb3_simulation_launch.py headless:=False use_rviz:=False &> nav2_tb3.log
### TB4
ros2 launch nav2_bringup tb4_simulation_launch.py headless:=False use_rviz:=False &> nav2_tb4.log

## You might need this if using WAYLAND
## https://gazebosim.org/docs/harmonic/troubleshooting/#wayland-issues
QT_QPA_PLATFORM=xcb ros2 launch nav2_bringup tb3_simulation_launch.py headless:=False
```
