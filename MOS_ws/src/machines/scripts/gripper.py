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
    client = Client("opc.tcp://10.226.52.227:4994")
    client.connect()
    cmdGripperOpen = client.get_node("ns=3;s=[PLC]HMI_Manual_Gripper_Open")
    cmdGripperClose = client.get_node("ns=3;s=[PLC]HMI_Manual_Gripper_Close")

    if data.extended:
        cmdGripperClose.set_value(False)
        cmdGripperOpen.set_value(True)
        print("Executed extend")
    if data.retracted:
        cmdGripperOpen.set_value(False)
        cmdGripperClose.set_value(True)
        print("Executed retract")
    
    client.disconnect()

def main():
    status = Pneumatic()
    stn1url = "opc.tcp://10.226.52.227:4994"
    client1 = Client(stn1url)

    pub = rospy.Publisher('status/gripper', Pneumatic, queue_size=10)
    rospy.init_node('gripper', anonymous=True)
    rospy.Subscriber('control/gripper', Pneumatic, callback)
    rate = rospy.Rate(1)

    while not rospy.is_shutdown():
        client1.connect()
        Gripper1_Open = client1.get_node("ns=3;s=::[PLC]aentr:2:I.2")
        status.header.frame_id = 'gripperStatus'
        status.header.stamp = rospy.Time.now()
        status.extended = Gripper1_Open.get_value()
        status.retracted = not status.extended
        pub.publish(status)
        rate.sleep()
        client1.disconnect()

if __name__ == '__main__':

    try:
        main()

    except rospy.ROSInterruptException:
        print('disconnected and exiting')   