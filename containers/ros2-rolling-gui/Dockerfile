FROM osrf/ros:rolling-desktop

# Install basic packages
RUN apt-get update && \
    apt-get install -y \
      sudo \
      curl \
      wget \
      git \
      tmux \
      vim \
      just

# Install ROS2 packages
RUN apt-get update && \
    apt-get install -y \
      ros-rolling-rmw-cyclonedds-cpp \
      ros-rolling-ros-gz-bridge \
      ros-rolling-ros-gz-sim \
      libceres-dev

# Make user able to use sudo
ARG USERNAME=ros2
ARG UID=1000
ARG GID=1000
# Remove old ubuntu user
RUN userdel ubuntu
# Create the user
RUN groupadd -g $GID $USERNAME && \
    useradd -m -s /bin/bash -u $UID -g $USERNAME $USERNAME
# Add sudo
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME
# Switch to the user
USER $USERNAME

# Set an entry point for the container
CMD ["/bin/bash"]
