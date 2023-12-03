# ROS Noetic... Dockerized

Forked from Adeeb Abbas's project [ros2-docker-dev](https://github.com/adeeb10abbas/ros2-docker-dev).

This is a ROS Noetic environment streamlined for ROB456 development, and ROS development in general.

## Installation
Add the following to your `~/.bashrc` or `~/.zshrc`, or run the provided `setup.sh` (only for `bash` users). 
Note - change `$SCRIPT-DIR` to the path of the cloned repo. The `setup.sh` would do this automatically for `bash` users. 
```
ros_dev() {
  # Check if the correct number of arguments were provided
  if (( $# % 2 != 0 )); then
    echo "Usage: ros_dev <container_name1> <project_path1> [<container_name2> <project_path2> ...]"
    return 1
  fi

  while (( $# >= 2 )); do
    # Set environment variables
    export ROS_DEV_CONTAINER_NAME=$1
    export ROS_PROJECT_PATH=$2
    shift 2

    # Run docker-compose from the correct directory
    cd "$SCRIPT_DIR" && docker-compose up -d --build
  done
}
```
## Usage
To run a container with your ROS project, use

```
ros_dev my_ros_container /path/to/my/ros/project
```

The above command will build the container and mount the project directory to 
the container's `/ros2_ws` directory. The container will be named my_ros_container 
and will be run in the background. To access the container via bash shell: 

```
docker exec -it my_ros_container /bin/bash
```

The container's `.bashrc` (located in the config folder of this repo) will source the correct files,
and warn the user if the project hasn't been built yet.

Catmux has been added to the environment, and bash commands are available to you.
When working inside the container, use

```
cmux <package-name>
```

to run the package's `src/launch/catmux.yaml` launch file. Or launch traditionally using `roslaunch`.

* `C-a` `x` will kill the tmux server and stop all running ROS nodes.
* Alternatively, type `cmux-kill` to kill a background catmux session.
* Refer to `config/.tmux.conf` for more keybindings.

To make it a super convenient development environment, after running the container. [Just open up VSCode and click on `Attach to a Running Container`](https://code.visualstudio.com/docs/devcontainers/attach-container)

To access any desktop visualizations like RViz, go to your local vnc server: 
http://localhost:8080/vnc.html. This should work for essentially all kinds of machines. 
It's much easier to get this working, so I recommend using this method if you're just trying to get something going. 

However, if you have an Nvidia GPU and you have figured out how to install the 
nvidia-docker2 jazz. You can use rocker. You can also use Intel Integrated Graphics  with rocker, however, I haven't tested it. rocker is a tool that allows you to run  docker containers with hardware acceleration. To use rocker, with our containers run the following:
`rocker --nvidia --x11 -- my_ros_container`