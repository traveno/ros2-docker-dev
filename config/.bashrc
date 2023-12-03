# For catmux
export PATH="$HOME/.local/bin:$PATH"

# Source ROS setup
source /opt/ros/noetic/setup.bash

# If a project setup.bash exists, source it
if test -f /ros2_ws/devel/setup.bash; then
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
    echo "Will look for <ros_package>/config/catmux.yaml"
    return 1
  fi

  # Check if the package config exists
  if test -f $(rospack find $1)/config/catmux.yaml; then
    catmux_create_session $(rospack find $1)/config/catmux.yaml
  fi
}

cmux-kill ()
{
  tmux -L catmux kill-server
}

# Start in the project directory
cd /ros2_ws