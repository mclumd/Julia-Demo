#!/bin/bash

# First load everything
source /opt/ros/indigo/setup.bash
source /home/mcl/ROS/bobdemo_ws/devel/setup.bash

# Start ROS
xterm -e "roscore" &
sleep 10

roslaunch drone_tracker_demo bob_demo_alma_asoa_partial.launch
