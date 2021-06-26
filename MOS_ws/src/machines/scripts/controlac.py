#!/usr/bin/env python

import rospy
from machines.msg import MAMcmd, MAMstatus
import sys
import time

def callback(data):
    pos= data.position
    #print("current position is -{}".format(pos))
    

def main():
    global extend
    control = MAMcmd()
    #control=Pneumatic()
    pub = rospy.Publisher('control/xaxis', MAMcmd, queue_size=10)
    rospy.init_node('controlac', anonymous=True)
    rate = rospy.Rate(1)
    rospy.Subscriber('status/xaxis', MAMstatus, callback)

    while not rospy.is_shutdown():
        mType = raw_input("enter move type (0 - 6) = ")
        mType_int= int(mType,8)
        position = raw_input("enter position = ")
        position_float= float(position)
        speed = raw_input("enter speed = ")
        speed_float= float(speed)
        control.moveType = mType_int
        control.position = position_float
        control.speed = speed_float
        control.header.frame_id = 'AXISControl'
        control.header.stamp = rospy.Time.now()
        pub.publish(control)

        print('published')
        rate.sleep()


if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        print("ros interrupt exception")