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
    controlx = MAMcmd()
    controlz = MAMcmd()
    #control=Pneumatic()
    pubx = rospy.Publisher('control/xaxis', MAMcmd, queue_size=10)
    pubz = rospy.Publisher('control/zaxis', MAMcmd, queue_size=10)
    rospy.init_node('controlz', anonymous=True)
    rate = rospy.Rate(1)
    rospy.Subscriber('status/zaxis', MAMstatus, callback)

    while not rospy.is_shutdown():
        mType = raw_input("enter move type 0 absolute, 1 increment = ")
        mType_int= int(mType,8)
        positionx = float(raw_input("enter position for x = "))
        positionz = float(raw_input("enter position for z = "))
        # speed = raw_input("enter speed = ")
        speed_float= 25
        controlx.moveType = mType_int
        controlx.position = positionx
        controlx.speed = speed_float
        controlx.header.frame_id = 'XAXISControl'
        controlx.header.stamp = rospy.Time.now()
        controlz.moveType = mType_int
        controlz.position = positionz
        controlz.speed = speed_float
        controlz.header.frame_id = 'ZAXISControl'
        controlz.header.stamp = rospy.Time.now()
        pubx.publish(controlx)
        pubz.publish(controlz)
        print('published')
        rate.sleep()
    

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        print("ros interrupt exception")