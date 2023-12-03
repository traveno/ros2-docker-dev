# Use the official ROS image as the base image
FROM ros:noetic-perception-focal

# Set shell for running commands
SHELL ["/bin/bash", "-c"]

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    git \
    tmux \
    python3-colcon-common-extensions \
    python3-colcon-mixin \
    python3-rosdep \
    python3-vcstool \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-noetic-desktop \
    ros-noetic-stage-ros \
    ros-noetic-slam-gmapping \
    && rm -rf /var/lib/apt/lists/*

# Install catmux
RUN pip3 install --user catmux

# Tmux theme
RUN git clone https://github.com/pineapplegiant/spaceduck-terminal /root/.tmux-spaceduck

# Set the entrypoint to source ROS setup.bash and run a bash shell
COPY docker-entry.sh /docker-entry.sh
ENTRYPOINT ["/docker-entry.sh", "/bin/bash"]