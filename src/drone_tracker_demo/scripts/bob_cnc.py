#!/usr/bin/env python
import rospy
import rospy
from std_msgs.msg import String
from alma_ros_pkg.msg import AlmaFmla
from alma_ros_pkg.msg import AlmaDB

import re
import thread
import time
import thread
import sys


# Global variables for publishers and  subscribers
alma_node_cmd  = None

# Compile the regular expressions we'll use
action_parse = re.compile("\\s*action\((.*)\)")
wait_parse = re.compile("\\s*wait\((\\d+)\)")
say_parse = re.compile("\\s*say\((.*)\)")


# Keep track of julia in ALMA.  We want to know when she's moved
def julia_tracker_alma_init():
    global alma_node_cmd

    alma_node_cmd.publish("af(if(  and(and(juliaAt(X,Y,Z,S), juliaAt(A,B,C,T)), eval_bound(T > S, [T, S])), juliaMoved)).")
    alma_node_cmd.publish("af(if(  juliaMoved, and(eval_bound(df(juliaMoved),[]), action(say('julia_moved'))))).")
    alma_node_cmd.publish("af(if(  and(and(juliaAt(X,Y,Z,S), juliaAt(A,B,C,T)), eval_bound(T > S, [T, S])), and(eval_bound(df(juliaAt(X,Y,Z,S)), [X,Y,Z,S]), eval_bound(af(juliaAt(A,B,C,T)), [A,B,C,T])))).")

    

"""

We will subscribe to the an ALMA node and look for 'action(X)'
statements.  Upon seeing such a predicate, we will remove it from the
database, replace them with 'doing(X)' and start a process of
executing the command.  When it is complete, we will remove 'doing(X)'
and replace it with 'done(X)'.

Evenentually the replacing of doing(X) with done(X) might want to be handled by
an ALMA theory.

"""

# For now, we'll support commands to wait for a certain number of seconds and to say something.

def process_command(action_cmd, action_fmla):
    global wait_parse
    global say_parse
    global alma_node_cmd

    print("Got " + action_cmd + " and " + action_fmla)
    
    # For some reason the action_fmla picks up a leading whitespace which can prevent
    # things from working correctly
    action_fmla = action_fmla.replace(' ', '')



    wait_m = wait_parse.match(action_cmd)
    if wait_m:
        num_secs = int(wait_m.group(1))
        print("Waiting for "  + str(num_secs) + " seconds.")
        time.sleep(num_secs)
        print("Done waiting.")
        
        
        alma_node_cmd.publish("df(doing(" + action_fmla.replace(' ', '') + ")).")
        alma_node_cmd.publish("af(done(" + action_fmla.replace(' ', '') + ")).")
        rospy.sleep(1)
        return

    say_m = say_parse.match(action_cmd)
    if say_m:
        string_to_say = say_m.group(1).replace('_', ' ')
        #For now, we'll just write to stderr.  Eventually go through asoa_say
        sys.stderr.write(string_to_say)
        rospy.sleep(1)
        alma_node_cmd.publish("df(doing(" + action_fmla + ")).")
        alma_node_cmd.publish("af(done(" + action_fmla + ")).")
        return


def alma_db_callback(data):
    alma_db = data.entries
    global action_parse
    global alma_node_cmd

    for i in range(len(alma_db)):
        alma_fmla = alma_db[i]
        fmla_code = alma_fmla.code
        fmla_stmnt = alma_fmla.fmla
        m = action_parse.match(fmla_stmnt)
        if m:
            print("Got an action!")
            action = m.group(1)
            print("Asked to execute action: " + action)
            alma_node_cmd.publish("df(" + fmla_stmnt + ").")
            alma_node_cmd.publish("af(doing(" + fmla_stmnt + ")).")
            process_command(action, fmla_stmnt)
            
            
        
    


def main():
    global alma_node_cmd
    
    rospy.init_node('bob_central')
    alma_node_cmd = rospy.Publisher('/alma_node_cmd', String, queue_size=100, latch=True)
    rospy.sleep(1)
    julia_tracker_alma_init()
    rospy.Subscriber('/alma_db', AlmaDB, alma_db_callback)
    rospy.spin()





if __name__ == '__main__':
    main()    

