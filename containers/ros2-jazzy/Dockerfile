FROM ros:jazzy-ros-core

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    --no-install-recommends \
      build-essential \
      clang \
      cmake \
      python3 \
      ros-jazzy-rmw-cyclonedds-cpp \
      ros-jazzy-ament-cmake-vendor-package \
      python3-colcon-common-extensions \
      python3-setuptools \
      python3-colcon-mixin \
      python3-rosdep \
      python3-vcstool \
      python3-pip \
      python3-pandas \
      python3-matplotlib \
      sudo \
      curl \
      wget \
      git \
      tmux \
      vim \
      just

# Install ROS necessary packages
RUN apt update && \
    apt install -y \
      python3-flake8-blind-except \
      python3-flake8-class-newline \
      python3-flake8-deprecated \
      python3-mypy \
      python3-pip \
      python3-pytest \
      python3-pytest-cov \
      python3-pytest-mock \
      python3-pytest-repeat \
      python3-pytest-rerunfailures \
      python3-pytest-runner \
      python3-pytest-timeout \
      ros-dev-tools

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
