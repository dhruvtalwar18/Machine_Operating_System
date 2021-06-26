#!/usr/bin/env python
import rospy
from opcua import Client, ua
from machines.msg import Sensor
import sys
import time


def main():
    status = Sensor()
    stn1url = "opc.tcp://10.226.52.227:4994"
    client1 = Client(stn1url)

    pub = rospy.Publisher('status/exitOne', Sensor, queue_size=10)
    rospy.init_node('exitOne', anonymous=True)
    # rospy.Subscriber('control/gripper', Sensor, callback)
    rate = rospy.Rate(1)

    while not rospy.is_shutdown():
        client1.connect()
        Exit1 = client1.get_node("ns=3;s=::[PLC]iolinkblock1:I1.Data[0].0")
        status.header.frame_id = 'exitOne'
        status.header.stamp = rospy.Time.now()
        status.data = Exit1.get_value()
        pub.publish(status)
        rate.sleep()
        client1.disconnect()

if __name__ == '__main__':

    try:
        main()

    except rospy.ROSInterruptException:
        print('disconnected and exiting')   