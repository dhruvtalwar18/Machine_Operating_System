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

    pub = rospy.Publisher('status/appsensormone', Sensor, queue_size=10)
    rospy.init_node('appsensormone', anonymous=True)
    rate = rospy.Rate(1)

    while not rospy.is_shutdown():
        client1.connect()
        MOne_app_sensor = client1.get_node("ns=3;s=::[PLC]iolinkblock1:I1.Data[0].2")
        status.header.frame_id = 'appSensor'
        status.header.stamp = rospy.Time.now()
        status.data = MOne_app_sensor.get_value()
        pub.publish(status)
        rate.sleep()
        client1.disconnect()

if __name__ == '__main__':

    try:
        main()

    except rospy.ROSInterruptException:
        print('disconnected and exiting')   