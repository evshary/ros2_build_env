# ros2_build_env

The project is to setup ROS 2 development environment for vscode.

## Usage

### Using containers from vscode

1. Download devcontainer plugins in vscode.

2. Run vscode command: "Dev Containers: Rebuild and Reopen in containers"

   * Choose the container you want to use

### Using containers from script

```shell
./containers/<whatever you want>/run_container.sh
```

### Setup environment

* Follow the README inside the scripts folder.

## Note

You can modify `compileCommands` inside the `c_cpp_properties.json` to make tracing code easier.
