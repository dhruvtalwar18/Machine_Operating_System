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
    cmdLockingUp = client.get_node("ns=3;s=[PLC]HMI_Manual_LockingCylinder_Up")
    cmdLockingDown = client.get_node("ns=3;s=[PLC]HMI_Manual_Pallet_Locking_Down")

    if data.extended:
        cmdLockingDown.set_value(False)
        cmdLockingUp.set_value(True)
        print("locking extend")

    if data.retracted:
        cmdLockingUp.set_value(False)
        cmdLockingDown.set_value(True)
        print("locking retract")
    
    client.disconnect()

def main():

    status = Pneumatic()
    stn1url = "opc.tcp://10.226.52.227:4994"
    client1 = Client(stn1url)
    client1.connect()

    PalletLockingCylinder1_Down = client1.get_node("ns=3;s=::[PLC]aentr:1:I.6")
    pub = rospy.Publisher('status/locking', Pneumatic, queue_size=10)
    rospy.init_node('locking', anonymous=True)
    rospy.Subscriber('control/locking', Pneumatic, callback)
    rate = rospy.Rate(1)

    while not rospy.is_shutdown():
        
        status.header.frame_id = 'lockingStatus'
        status.header.stamp = rospy.Time.now()
        status.retracted = PalletLockingCylinder1_Down.get_value()
        status.extended = not status.retracted
        pub.publish(status)
        rate.sleep()

if __name__ == '__main__':

    try:
        main()

    except KeyboardInterrupt:
        print('exiting ...')   