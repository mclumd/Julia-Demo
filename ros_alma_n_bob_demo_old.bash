#!/bin/bash

# 1.  ALMA Demo
#    - start xterm publishing alma node
#    - show alma_cnc with wait; explain this is like carne
#    - restart alma node; keep track of julia's position

# 2.  ASOA Demo
#    - demo speaking without ASOA and getting into loop
#    - demo with ASOA, no loop
#    - demo mute
#    - demo mismatch


# ALMA Demo; showing carne-like features
source /opt/ros/indigo/setup.bash
source /home/mcl/ROS/bobdemo_ws/devel/setup.bash
xterm -e "roscore" &
sleep 10
rosrun alma_ros_pkg alma_node.py &
xterm -e "rostopic echo /alma_db" &
xterm -e "rostopic echo /alma_node_cmd" &
rosrun alma_ros_pkg alma_cnc.py &
sleep 2
rostopic pub -1 /alma_node_cmd  std_msgs/String "af(action(wait(10)))."
echo "Press ENTER to continue"
read



# ALMA Demo; tracking Julia
rosnode kill /command_central
rosnode kill /alma_node
sleep 1
rosrun alma_ros_pkg alma_node.py &
rosrun drone_tracker_demo bob_cnc.py &
sleep 6
rostopic pub -1 /alma_node_cmd  std_msgs/String "af(juliaAt(1,1,1,10))."
sleep 6
rostopic pub -1 /alma_node_cmd  std_msgs/String "af(juliaAt(1,1,1,20))."
sleep 6
rostopic pub -1 /alma_node_cmd  std_msgs/String "af(action(wait(10)))."
# Eventually have this interact with Jared's code

# ASOA demo
roslaunch drone_tracker_demo bob_demo_nosoa.launch
roslaunch drone_tracker_demo bob_demo_asoa.launch

