FROM ros:jazzy-ros-core

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    --no-install-recommends \
      build-essential \
      clang \
      cmake \
      python3 \
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
      tig \
      tmux \
      vim \
      just \
      valgrind \
      gdb gdbserver \
      ccache

# Install ROS necessary packages
RUN apt-get update && \
    apt-get install -y --only-upgrade ros-jazzy-* && \
    apt-get install -y \
      ros-jazzy-rmw-cyclonedds-cpp \
      ros-jazzy-ament-cmake-vendor-package \
      ros-jazzy-demo-nodes-cpp \
      ros-jazzy-demo-nodes-py \
      ros-jazzy-action-tutorials-cpp \
      ros-jazzy-action-tutorials-py

# Install ROS build system necessary packages
RUN apt-get update && \
    apt-get install -y \
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

# Enable bash complete
RUN rm /etc/apt/apt.conf.d/docker-clean
RUN apt-get update && \
    apt-get install -y bash-completion

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

# Use ZSH
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.2.1/zsh-in-docker.sh)" -- \
    -t candy \
    -p git \
    -p git-flow \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions

ENV DOCKER_IMAGE=ros2-jazzy
RUN echo 'PS1="%{$fg_bold[red]%}(${DOCKER_IMAGE}) $PS1"' >> ~/.zshrc

# Set an entry point for the container
CMD ["/bin/zsh"]
