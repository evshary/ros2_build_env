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

Note that containers won't be deleted after your experiment.
This keeps the packages you installed can be reused.

### Run the scenario

The scenario scripts is insides the script folder.

```shell
just scripts/ros2-<version>/<scenario>/all
```

## Note

You can modify `compileCommands` inside the `c_cpp_properties.json` to make tracing code easier.
