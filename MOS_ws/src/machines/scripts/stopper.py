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
    cmdStopperDown = client.get_node("ns=3;s=[PLC]HMI_Manual_Stopper_Dwn")

    if data.extended:
        cmdStopperDown.set_value(False)
        print("stopper extend")

    if data.retracted:
        cmdStopperDown.set_value(True)
        print("stopper retract")
        
    client.disconnect()

def main():
    status = Pneumatic()
    stn1url = "opc.tcp://10.226.52.227:4994"
    client1 = Client(stn1url)
    client1.connect()
    StoppingCylinder1_up = client1.get_node("ns=3;s=::[PLC]aentr:1:I.0")
    pub = rospy.Publisher('status/stopper', Pneumatic, queue_size=10)
    rospy.init_node('stopper', anonymous=True)
    rospy.Subscriber('control/stopper', Pneumatic, callback)
    rate = rospy.Rate(1)

    while not rospy.is_shutdown():

        status.header.frame_id = 'stopperStatus'
        status.header.stamp = rospy.Time.now()
        status.extended = StoppingCylinder1_up.get_value()
        status.retracted = not status.extended
        pub.publish(status)
        rate.sleep()

if __name__ == '__main__':

    try:
        main()

    except KeyboardInterrupt:
        print('exiting...')   