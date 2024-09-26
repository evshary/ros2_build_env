FROM osrf/ros:jazzy-desktop

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
      ros-jazzy-navigation2 \
      ros-jazzy-nav2-bringup \
      ros-jazzy-turtlebot3*

# Install other packages
RUN apt-get update && \
    apt-get install -y \
      sudo \
      curl \
      wget \
      git \
      tmux \
      vim \
      just
