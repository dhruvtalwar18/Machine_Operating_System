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

cmdGripperOpen = ''
cmdGripperClose = ''

def callback(data):
    global cmdCylinderBack
    global cmdCylinderFwd

    if data.extended:
        cmdCylinderBack.set_value(False)
        cmdCylinderFwd.set_value(True)
        print("Executed extend")

    if data.retracted:
        cmdCylinderFwd.set_value(False)
        cmdCylinderBack.set_value(True)
        print("Executed retract")

def main():
    global cmdCylinderBack
    global cmdCylinderFwd
    status = Pneumatic()
    stn1url = "opc.tcp://10.226.52.227:4994"
    client1 = Client(stn1url)
    client1.connect()
    print("station 1 connected")
    MotorCylinder1_Back = client1.get_node("ns=3;s=::[PLC]aentr:1:I.5")
    cmdCylinderFwd = client1.get_node("ns=3;s=[PLC]HMI_Manual_Motor_Fwd")
    cmdCylinderBack = client1.get_node("ns=3;s=[PLC]HMI_Manual_MotorCylinder_Back")
    pub = rospy.Publisher('status/motorCyclinder', Pneumatic, queue_size=10)
    rospy.init_node('motorCylinder', anonymous=True)
    rospy.Subscriber('control/motorCylinder', Pneumatic, callback)
    rate = rospy.Rate(1)

    while not rospy.is_shutdown():

        status.header.frame_id = 'motorCylinderStatus'
        status.header.stamp = rospy.Time.now()
        status.retracted = MotorCylinder1_Back.get_value()
        status.extended = not status.retracted
        pub.publish(status)
        rate.sleep()

if __name__ == '__main__':

    try:
        main()

    except rospy.ROSInterruptException:
        print('disconnected and exiting')   