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
    cmdClampingCylnderForward= client.get_node("ns=3;s=[PLC]HMI_Manual_ClampingCylinder_Forward")
    cmdClampingCylnderBack= client.get_node("ns=3;s=[PLC]HMI_Manual_ClampingCylinder_Back")
    
    if data.extended:
        cmdClampingCylnderBack.set_value(False)
        cmdClampingCylnderForward.set_value(True)
        print("clamping extended")
    
    if data.retracted:
        cmdClampingCylnderForward.set_value(False)
        cmdClampingCylnderBack.set_value(True)
        print("clamping retracted")
        
    client.disconnect()
    cmdClampingCylnderBack = ''
    cmdClampingCylnderForward = ''
    
def main():
    status= Pneumatic()
    stn1url = "opc.tcp://10.226.52.227:4994"
    client1 = Client(stn1url)
    client1.connect()
    pub = rospy.Publisher('status/clamping', Pneumatic, queue_size=10)
    rospy.init_node('clamping', anonymous=True)
    rospy.Subscriber('control/clamping', Pneumatic, callback)
    
    rate = rospy.Rate(1)
    
    while not rospy.is_shutdown():
        client1.connect()
        PalletClampingCylinder1_Forward = client1.get_node("ns=3;s=::[PLC]aentr:1:I.7")
        status.header.frame_id = 'clampingStatus'
        status.header.stamp = rospy.Time.now()
        status.extended = PalletClampingCylinder1_Forward.get_value()
        status.retracted = not status.extended
        pub.publish(status)
        
        rate.sleep()
        client1.disconnect()


if __name__ == '__main__':
    try:
        main()

    except KeyboardInterrupt:
        print('exiting ...')  