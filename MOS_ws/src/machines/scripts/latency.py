#!/usr/bin/env python

import rospy
from machines.msg import Pneumatic
import sys
import time

extend = ''

def clampings(r):
    clamp = Pneumatic()
    pub = rospy.Publisher('control/clamping', Pneumatic, queue_size=10)
    clamp.header.frame_id ='clamping'
    clamp.header.stamp = rospy.Time.now()
    clamp.extended = not r
    clamp.retracted = r
    pub.publish(clamp)
    print('published command')

def callback(data):
    global extend, pos
    extend= data.extended
    if data.extended :
        pos= "extended"
    else:
        pos="retracted"
    # print("current status is : "+ pos)
    
def main():
    global pos, extend
    rospy.init_node('controlpn', anonymous=True)
    rate = rospy.Rate(1)
    rospy.Subscriber('status/clamping', Pneumatic, callback)
    
    while not rospy.is_shutdown() :
        choice=raw_input("Change the position(1/0) :")
        print('choice - ', choice)
        if choice:
            a = time.time()
            
            clampings(extend)

            print('the latency is - ', time.time() - a)
            # clampings(0)
        rate.sleep()
        
if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print("exiting ...")

