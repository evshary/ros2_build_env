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

# Make user able to use sudo
ARG USERNAME=ubuntu
ARG UID=1000
ARG GID=1000
# Create the user
RUN groupadd -g $GID $USERNAME && \
    useradd -m -s /bin/bash -u $UID -g $USERNAME $USERNAME
# Add sudo
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME
# Switch to the user
USER $USERNAME
# Set the workdir
WORKDIR /home/$USERNAME

# Set an entry point for the container
CMD ["/bin/bash"]
