#!/usr/bin/env python

import rospy
from machines.msg import MAMcmd, MAMstatus, Pneumatic
import sys
import time

extend = ''
choice=''


def callback(data):
    global extend, choice
    extend=data.extended
    if data.extended :
        pos =" retracted"
    else:
        pos="extended"
    #pos = data.position
    print("the current position is "+ pos)
    

def main():
    global extend
    #control =  MAMcmd()
    control=Pneumatic()
    pub = rospy.Publisher('control/pallet', Pneumatic, queue_size=10)
    rospy.init_node('controlTest', anonymous=True)
    rate = rospy.Rate(1)
    rospy.Subscriber('status/pallet', Pneumatic, callback)

    while not rospy.is_shutdown():
        choice=raw_input("Change the position(1/0) :")
        if choice:
            control.header.frame_id='palletControl'
            control.header.stamp= rospy.Time.now()
            control.extended= not extend
            control.retracted= not control.extended
            pub.publish(control)
            print('published')
        #mType = raw_input("enter move type (0 - 6) = ")
        #mType_int= int(mType,8)
        #position = raw_input("enter position = ")
        #position_float= float(position)
        #speed = raw_input("enter speed = ")
        #speed_float= float(speed)
        #control.moveType = mType_int
        #control.position = position_float
        #control.speed = speed_float
        #control.header.frame_id = 'palletControl'
        #control.header.stamp = rospy.Time.now()
        
        
        
        
        rate.sleep()


if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        print("ros interrupt exception")