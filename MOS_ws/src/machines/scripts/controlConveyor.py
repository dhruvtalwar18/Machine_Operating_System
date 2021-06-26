#!/usr/bin/env python

import rospy
from machines.msg import Conveyorcmd, Conveyorstatus
import sys
import time

def callback(data):
    print('read',data)

def main():
    control = Conveyorcmd()
    pub = rospy.Publisher('control/conveyor', Conveyorcmd, queue_size=10)
    rospy.init_node('controlconveyor', anonymous=True)
    rate = rospy.Rate(1)
    rospy.Subscriber('status/conveyor', Conveyorstatus, callback)

    while not rospy.is_shutdown():
        directionInput = raw_input("enter the direction forward (1) or backward (0) = ")
        directionVal = float(directionInput)
        speedInput = raw_input("ener the speed = ")
        speedVal = float(speedInput)
        control.direction = directionVal
        control.speed =speedVal
        control.header.frame_id = 'conveyorControl'
        control.header.stamp = rospy.Time.now()
        pub.publish(control)
        print('published')
        rate.sleep()

if __name__ == "__main__":
    try:
        main()
    except rospy.ROSInterruptException:
        print("ros interrupt exception")

