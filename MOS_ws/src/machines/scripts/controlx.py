#!/usr/bin/env python

import rospy
from machines.msg import MAMcmd, MAMstatus
import sys
import time

extend = ''

def callback(data):
    # pos= data.position
    #print("current position is -{}".format(pos))
    pass    

def main():
    global extend
    control =MAMcmd()
    #control=Pneumatic()
    pub = rospy.Publisher('control/xaxis', MAMcmd, queue_size=10)
    rospy.init_node('controlx', anonymous=True)
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
        control.header.frame_id = 'XAXISControl'
        control.header.stamp = rospy.Time.now()
        pub.publish(control)
        
        print('published')
        rate.sleep()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        print("ros interrupt exception")