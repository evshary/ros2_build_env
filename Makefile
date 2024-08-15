.PHONY: download dependency build clean

all: download dependency build

download:
	wget https://raw.githubusercontent.com/ros2/ros2/jazzy/ros2.repos
	mkdir -p src
	vcs import src < ros2.repos
	vcs pull src

dependency:
	rosdep update
	rosdep install --from-paths src --ignore-src -y --skip-keys "fastcdr rti-connext-dds-6.0.1 urdfdom_headers"

build:
	colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

clean:
	rm -rf build install log ros2.repos
