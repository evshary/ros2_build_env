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
./containers/<the environment you want>/run_container.sh
```

Note that containers won't be deleted after your experiment.
This keeps the packages you installed can be reused.

### Run the scenario

The scenario scripts is insides the script folder.

```shell
just scripts/ros2-<version>/<scenario>/all

# If there is no specific scenario scripts
# For example: just scripts/ros2-rolling/all demos https://github.com/ros2/demos.git
just scripts/ros2-<version>/all <folder> <repo url>
```

## Note

* You can modify `compileCommands` inside the `c_cpp_properties.json` to make tracing code easier.
* Install pre-commit to check Markdown.

   ```shell
   pre-commit install --install-hooks
   ```
