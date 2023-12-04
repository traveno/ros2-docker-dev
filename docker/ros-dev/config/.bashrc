# For catmux
export PATH="$HOME/.local/bin:$PATH"

# Source ROS setup
source /opt/ros/noetic/setup.bash

# If a project setup.bash exists, source it
if [ -f "/ros2_ws/devel/setup.bash" ]; then
  source /ros2_ws/devel/setup.bash
else
  echo "No project setup.bash found, run catkin_make to build..."
fi

# Catmux command
cmux ()
{
  # Check if the correct number of arguments were provided
  if (( $# != 1 )); then
    echo "Usage: cmux <ros_package>"
    echo "Will look for <ros_package>/launch/catmux.yaml"
    return 1
  fi

  # Check if the package config exists
  if [ -f "$(rospack find $1)/launch/catmux.yaml" ]; then
    catmux_create_session "$(rospack find $1)/launch/catmux.yaml"
  fi
}

cmux-kill ()
{
  tmux -L catmux kill-server
}

if [ -d "/ros2_ws" ]; then
  # Start in the project directory
  cd /ros2_ws
else
  echo "WARNING: /ros2_ws doesn't exist, please make sure you've mounted the project to the container!"
fi