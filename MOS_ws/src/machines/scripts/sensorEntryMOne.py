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

    pub = rospy.Publisher('status/entrysensor', Sensor, queue_size=10)
    rospy.init_node('entrysensor', anonymous=True)
    rate = rospy.Rate(1)

    while not rospy.is_shutdown():
        client1.connect()
        Entry1 = client1.get_node("ns=3;s=::[PLC]iolinkblock1:I1.Data[0].4")
        status.header.frame_id = 'entrySensor'
        status.header.stamp = rospy.Time.now()
        status.data = Entry1.get_value()
        pub.publish(status)
        rate.sleep()
        client1.disconnect()

if __name__ == '__main__':

    try:
        main()

    except rospy.ROSInterruptException:
        print('disconnected and exiting')   