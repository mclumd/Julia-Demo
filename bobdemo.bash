#!/bin/bash

# 1.  ASOA Demo
#    - demo speaking without ASOA and getting into loop
#    - demo with ASOA, no loop
#    - demo mute
#    - demo mismatch

source /opt/ros/indigo/setup.bash
source /home/mcl/ROS/bobdemo_ws/devel/setup.bash

# ASOA demo
roslaunch drone_tracker_demo bob_demo_asoa.launch 

