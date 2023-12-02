# Use the official ROS image as the base image
FROM ros:noetic-perception-focal

# Set shell for running commands
SHELL ["/bin/bash", "-c"]

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    git \
    python3-colcon-common-extensions \
    python3-colcon-mixin \
    python3-rosdep \
    python3-vcstool \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-noetic-desktop \
    ros-noetic-stage-ros \
    ros-noetic-slam-gmapping \
    && rm -rf /var/lib/apt/lists/*

RUN touch /root/.bashrc \
    && echo "source /opt/ros/noetic/setup.bash" >> /root/.bashrc \
    && echo "cd /ros2_ws" >> /root/.bashrc

# Set the entrypoint to source ROS setup.bash and run a bash shell
CMD ["/bin/bash"]
