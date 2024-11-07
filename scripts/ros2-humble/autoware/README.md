# Autoware Humble

Able to trace the code in Autoware Humble.

## Step

* Build the code

```shell
source /opt/ros/humble/setup.bash
# Download the code and dependencies. Then build it.
just scripts/ros2-humble/autoware/all
```

* Update `.vscode/c_cpp_properties.json`

  * `"compileCommands": "./autoware-humble/build/compile_commands.json",`

* Clean the project

```shell
just scripts/ros2-humble/autoware/clean
```
