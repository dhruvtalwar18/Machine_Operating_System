#!/usr/bin/env python

import rospy
from machines.msg import Pneumatic
import sys
import time

extend = ''

def callback(data):
    global extend
    extend= data.extended
    if data.extended :
        pos= "extended"
    else:
        pos="retracted"
    # print("current status is : "+ pos)
    
def main():
    global extend
    control=Pneumatic()
    pub = rospy.Publisher('control/clamping', Pneumatic, queue_size=10)
    rospy.init_node('controlpn', anonymous=True)
    rate = rospy.Rate(1)
    rospy.Subscriber('status/clamping', Pneumatic, callback)
    
    while not rospy.is_shutdown() :
        choice=raw_input("Change the position(1/0) :")
        if choice:
            control.header.frame_id='clampingControl'
            control.header.stamp= rospy.Time.now()
            control.extended= not extend
            control.retracted= not control.extended
            pub.publish(control)
            print('published')
        rate.sleep()
        
if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print("exiting ...")

