# ros2_build_env

The project is to setup ROS 2 development environment for vscode.

## Usage

### Choose either the following environment

#### Using containers in vscode

1. Download devcontainer plugins in vscode.

2. Run vscode command: "Dev Containers: Rebuild and Reopen in containers"

   * Choose the container you want to use

#### Using containers in terminal

```shell
source ./containers/<whatever you want>/env.sh
./run_container.sh
```

### Run the scenario

Here are the supported scenarios:

* [ROS 2 Jazzy source code](scripts/ros2-jazzy-src/README.md)
* [rmw_zenoh in ROS 2 Jazzy](scripts/ros2-jazzy-rmw-zenoh/README.md)
* [Navigation2 in ROS 2 Jazzy](scripts/ros2-jazzy-nav2/README.md)
* [Navigation2 in ROS 2 Rolling](scripts/ros2-rolling-nav2/README.md)
* [Autoware Humble](scripts/autoware-humble/README.md)

## Note

You can modify `compileCommands` inside the `c_cpp_properties.json` to make tracing code easier.
