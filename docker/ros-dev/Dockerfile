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
    ros-noetic-map-server \
    && rm -rf /var/lib/apt/lists/*

# Install catmux
RUN pip3 install --user catmux

# Copy in config
COPY config /config

# Append our .bashrc script and chmod it just in case
RUN cat /config/.bashrc >> /root/.bashrc \
    && chmod +x /root/.bashrc

# Bring in the tmux config
RUN cp /config/.tmux.conf /root/.tmux.conf

# We're done, run CMD and just "spin" ... ifykyk
CMD ["/bin/bash"]