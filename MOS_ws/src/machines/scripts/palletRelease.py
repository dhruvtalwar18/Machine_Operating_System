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
    cmdPalletLocked = client.get_node("ns=3;s=[PLC]HMI_Manual_PalletShaftDwn")
    cmdPalletRelease= client.get_node("ns=3;s=[PLC]HMI_Manual_PalletRelease_Up")

    if data.retracted:
        cmdPalletRelease.set_value(True)
        cmdPalletLocked.set_value(False)
        print("Executed Lock")
    if data.extended:
        cmdPalletLocked.set_value(True)
        cmdPalletRelease.set_value(False)
        print("Executed Release")
    
    
    client.disconnect()

def main():
    status = Pneumatic()
    stn1url = "opc.tcp://10.226.52.227:4994"
    client1 = Client(stn1url)

    pub = rospy.Publisher('status/pallet', Pneumatic, queue_size=10)
    rospy.init_node('palletRelease', anonymous=True)
    rospy.Subscriber('control/pallet', Pneumatic, callback)
    
    rate = rospy.Rate(1)

    while not rospy.is_shutdown():
        client1.connect()
        PalletReleaseCylinder1_Up = client1.get_node("ns=3;s=::[PLC]aentr:1:I.3")
        status.header.frame_id = 'palletStatus'
        status.header.stamp = rospy.Time.now()
        status.extended = PalletReleaseCylinder1_Up.get_value()
        status.retracted = not status.retracted
        pub.publish(status)
        

        rate.sleep()
        client1.disconnect()
        
    
if __name__ == '__main__':

    try:
        main()

    except KeyboardInterrupt:
        print('exiting ...')   