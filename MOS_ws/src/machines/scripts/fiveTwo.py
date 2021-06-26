#!/usr/bin/env python

import rospy
import machines.msg
import sys
import time

entry = ''
application = ''

def entrySensor(data):
    global entry
    entry = data.data

def appSensor(data):
    global application
    application = data.data

def conveyors(direction):

    conv = machines.msg.Conveyorcmd()
    pub = rospy.Publisher('control/conveyor', machines.msg.Conveyorcmd, queue_size=10)
    conv.header.frame_id ='conveyor'
    conv.header.stamp = rospy.Time.now()
    conv.direction = direction
    conv.speed = 5
    pub.publish(conv)


def stoppers(e):
    stop = machines.msg.Pneumatic()
    pub = rospy.Publisher('control/stopper', machines.msg.Pneumatic, queue_size=10)
    stop.header.frame_id ='stopper'
    stop.header.stamp = rospy.Time.now()
    stop.extended = e
    stop.retracted = not e
    pub.publish(stop)



def lockings(e):
    lock = machines.msg.Pneumatic()
    pub = rospy.Publisher('control/locking', machines.msg.Pneumatic, queue_size=10)
    lock.header.frame_id ='locking'
    lock.header.stamp = rospy.Time.now()
    lock.extended = e
    lock.retracted = not e
    pub.publish(lock)


def clampings(r):
    clamp = machines.msg.Pneumatic()
    pub = rospy.Publisher('control/clamping', machines.msg.Pneumatic, queue_size=10)
    clamp.header.frame_id ='clamping'
    clamp.header.stamp = rospy.Time.now()
    clamp.extended = not r
    clamp.retracted = r
    pub.publish(clamp)

def myhook():
    print('shutdown time!')

def main():
    global entry, application

    rospy.init_node('fiveTwo', anonymous=True)
    rate = rospy.Rate(1)

    rospy.Subscriber('status/entrysensor', machines.msg.Sensor, entrySensor)
    rospy.Subscriber('status/appsensormone', machines.msg.Sensor, appSensor)
    a = 0
    b = 0

    # while rospy.is_shutdown():
    #     continue
    # else:
    #     while not entry:
    #         continue
    #     else:
    #         conveyors(1)
    #         while not application:
    #             continue
    #         else:
    #             rate.sleep()
    #             stoppers(1)
    #             conveyors(0)
    #             lockings(1)
    #             clampings(1)
    #             wait.sleep()
    #             conveyors(1)
    #             stoppers(0)
    #             clampings(0)
    #             lockings(0)
    #             wait.sleep()
    #             conveyors(0)  
    rospy.on_shutdown(myhook)

    while not rospy.is_shutdown():
        rate.sleep()
        # while not entry:
        #     continue
        # else:
        #     conveyors(1)
        if entry and a < 2:
            conveyors(1)
            print('hi')
            a += 1

        if application and b < 2:
            stoppers(1)
            conveyors(0)
            lockings(1)
            clampings(1)
            rospy.sleep(5)
            conveyors(1)
            stoppers(0)
            clampings(0)
            lockings(0)
            rospy.sleep(5)
            conveyors(0)
            b += 1


if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        print("ros interrupt exception")