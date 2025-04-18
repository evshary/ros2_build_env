FROM osrf/ros:humble-desktop

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
      sudo \
      curl \
      wget \
      git \
      tig \
      tmux \
      vim \
      valgrind \
      gdb gdbserver \
      ccache \
      lsb-core

# For just
RUN wget -qO - 'https://proget.makedeb.org/debian-feeds/prebuilt-mpr.pub' | gpg --dearmor | sudo tee /usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg 1> /dev/null
RUN echo "deb [arch=all,$(dpkg --print-architecture) signed-by=/usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg] https://proget.makedeb.org prebuilt-mpr $(lsb_release -cs)" | sudo tee /etc/apt/sources.list.d/prebuilt-mpr.list
RUN apt-get update && \
    apt-get install -y just

# Install ROS necessary packages
RUN apt-get update && \
    apt-get install -y --only-upgrade ros-humble-* && \
    apt-get install -y \
      ros-humble-navigation2 \
      ros-humble-nav2-bringup \
      ros-humble-turtlebot3* \
      ros-humble-rmw-cyclonedds-cpp \
      ros-humble-demo-nodes-cpp \
      ros-humble-demo-nodes-py \
      ros-humble-action-tutorials-cpp \
      ros-humble-action-tutorials-py

# Enable bash complete
RUN rm /etc/apt/apt.conf.d/docker-clean
RUN apt-get update && \
    apt-get install -y bash-completion

# Make user able to use sudo
ARG USERNAME=ros2
ARG UID=1000
ARG GID=1000
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

ENV DOCKER_IMAGE=ros2-humble-gui
RUN echo 'PS1="%{$fg_bold[red]%}(${DOCKER_IMAGE}) $PS1"' >> ~/.zshrc

# Set an entry point for the container
CMD ["/bin/zsh"]
