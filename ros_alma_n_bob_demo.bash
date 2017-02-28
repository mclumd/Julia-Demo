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

# First load everything
source /opt/ros/indigo/setup.bash
source /home/mcl/ROS/bobdemo_ws/devel/setup.bash

# Start ROS
xterm -e "roscore" &
sleep 10

# Start the alma node.  The alma_db topic contains the contents of the
# database at the current time.  The alma_node_cmd is read for
# incoming commnads (e.g. to add or delete a formula)

rosrun alma_ros_pkg alma_node.py &
xterm -e "rostopic echo /alma_db" &
xterm -e "rostopic echo /alma_node_cmd" &

# Show the Carne-like features.  alma_cnc.py will montior the
# database, looking for formulae of the form "action(X)".  It will
# then execute that action.  While it's executing, it will write
# "doing(X)" to the database, and write "done(X)" when finished.  This
# demo only supports X of the form "wait(t)" where t is the number of
# seconds.

rosrun alma_ros_pkg alma_cnc.py &
sleep 2

# Add "action(wait(10))" to the database; this will cause alma_cnc.py
# to do its thing.

rostopic pub -1 /alma_node_cmd  std_msgs/String "af(action(wait(10)))."
echo "Press ENTER to continue"
read



# ALMA Demo; tracking Julia. The bob_cnc.py will basically read the
# database for formulae of the form "juliaAt(x,y,z,t)" indicating that
# Julia is at (X,Y,Z) at time t.  If Julia seems to be in two places
# at once, only use the most recent sighting and conclude that juli
# has moved.

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

# ASOA demo: have Bob point at Julia without (then with) a sense of
# agency.  The latest version of this will just use one launch file
# and turn on and off sense of agency based on commnds.

roslaunch drone_tracker_demo bob_demo_nosoa.launch
roslaunch drone_tracker_demo bob_demo_asoa.launch

