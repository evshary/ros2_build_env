# ros2_build_env

This is the environment to trace ROS 2 Jazzy code in vscode.

## Usage

1. Download devcontainer plugins in vscode.

2. Run vscode command: "Dev Containers: Rebuild and Reopen in containers"

3. Download and build ROS 2 code

   ```shell
   make
   ```

4. Clean all the code

   ```shell
   make clean
   ```

## Note

* If you want to trace code, you can start from `src/ros2/examples/rclcpp`.
