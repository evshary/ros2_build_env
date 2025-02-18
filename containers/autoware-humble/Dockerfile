FROM ghcr.io/autowarefoundation/autoware:universe-devel-cuda-20250131-amd64

# For just
RUN wget -qO - 'https://proget.makedeb.org/debian-feeds/prebuilt-mpr.pub' | gpg --dearmor | sudo tee /usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg 1> /dev/null
RUN echo "deb [arch=all,$(dpkg --print-architecture) signed-by=/usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg] https://proget.makedeb.org prebuilt-mpr $(lsb_release -cs)" | sudo tee /etc/apt/sources.list.d/prebuilt-mpr.list

# Download necessary packages
RUN apt-get update
# Useful tools
RUN apt-get install -y wget unzip tmux inetutils-ping curl vim parallel just tig pipx
RUN printf 'set-option -g default-shell /bin/bash\nset -g default-terminal "tmux-256color"' > /etc/tmux.conf
# Used by zenoh-bridge-ros2dds
RUN apt-get install -y llvm-dev libclang-dev cmake 
# Used by Autoware & my ROS packages
RUN python3 -m pip install gdown
RUN pipx install ansible
RUN apt-get install -y ros-humble-moveit-msgs \
                       ros-humble-object-recognition-msgs \
                       ros-humble-octomap-msgs

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

ENV DOCKER_IMAGE=autoware-humble
RUN echo 'PS1="%{$fg_bold[red]%}(${DOCKER_IMAGE}) $PS1"' >> ~/.zshrc

# Set an entry point for the container
CMD ["/bin/zsh"]
