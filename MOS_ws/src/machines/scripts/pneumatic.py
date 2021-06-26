#!/usr/bin/env python

import rospy
from opcua import Client, ua
from machines.msg import Pneumatic
import sys
import time

# <---------------------------------- error handling
def error_handling(block):
    return 'Retrying {}. {}. {}, line: {}'.format(block, sys.exc_info()[0], sys.exc_info()[1], sys.exc_info()[2].tb_lineno)
# ------------------------------------------>

def callback(data):
    client = Client("url")
    client.connect()
    cmdExtend = client.get_node("extend command node address")
    cmdRetract = client.get_node("retract command node address")

    if data.extended:
        cmdRetract.set_value(False)
        cmdExtend.set_value(True)
        print("Executed extend")
    if data.retracted:
        cmdExtend.set_value(False)
        cmdRetract.set_value(True)
        print("Executed retract")
    
    client.disconnect()

def main():
    status = Pneumatic()
    stn1url = "url"
    client1 = Client(stn1url)

    pub = rospy.Publisher('pubtopic', Pneumatic, queue_size=10)
    rospy.init_node('node name', anonymous=True)
    rospy.Subscriber('subtopic', Pneumatic, callback)
    rate = rospy.Rate(1)

    while not rospy.is_shutdown():
        client1.connect()
        extendStatus = client1.get_node("position status node address")
        status.header.frame_id = 'Status'
        status.header.stamp = rospy.Time.now()
        status.extended = extendStatus.get_value()
        status.retracted = not status.extended
        pub.publish(status)
        rate.sleep()
        client1.disconnect()

if __name__ == '__main__':

    try:
        main()

    except rospy.ROSInterruptException:
        print('disconnected and exiting')   