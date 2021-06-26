#!/usr/bin/env python

import rospy
from machines.msg import Conveyorcmd, Conveyorstatus
from pycomm.ab_comm.clx import Driver as ClxDriver
import sys
import time


def callback(data):
    d = ClxDriver()
    d.open('10.226.52.171')
    d.write_tag([('Conveyer_block_on', 1,'BOOL')])
    d.write_tag([('Conveyer_block_on', 0,'BOOL')])


    if data.direction == 1:
        d.write_tag([('Jog_negative',1,'BOOL'), ('Jog_Positive', 0, 'BOOL'), ('Manual_Jog_Speed_rev', 5, 'DINT')])
        d.write_tag([('Conveyer_block_on', 1,'BOOL')])
        print('conveyor forward')

    if data.direction == 0:
        d.write_tag([('Jog_Positive', 0, 'BOOL'), ('Jog_negative',0,'BOOL'), ('Manual_Jog_Speed_fwd', 0, 'DINT'),('Manual_Jog_Speed_rev', 0, 'DINT')])
        d.write_tag([('Conveyer_block_on', 1,'BOOL')])
        print('conveyor stopped')

    if data.direction == 3:
        d.write_tag([('Jog_Positive', 1, 'BOOL'), ('Jog_negative',0,'BOOL'), ('Manual_Jog_Speed_fwd', 5, 'DINT')])
        d.write_tag([('Conveyer_block_on', 1,'BOOL')])
        print('conveyor reverse')
    d.close()


def main():
    c = ClxDriver()
    status = Conveyorstatus()
    pub = rospy.Publisher('status/conveyor', Conveyorstatus, queue_size=10)
    rospy.init_node("conveyor", anonymous=True)
    rospy.Subscriber('control/conveyor', Conveyorcmd, callback)
    rate = rospy.Rate(1.5)
    while not rospy.is_shutdown():
        c.open('10.226.52.171')
        time.sleep(1)
        # print('c.read_tag-------------', type(c.read_tag(['EM05_ConveyorAxis_CD.Sts_EN'])[0][1]))
        # status.header.frame_id = 'z axis status'
        # status.header.stamp = rospy.Time.now()
        # status.enable = c.read_tag(['EM05_ConveyorAxis_CD.Sts_EN'])[0][1]
        # status.error = c.read_tag(['EM05_ConveyorAxis_CD.Sts_ER'])[0][1]
        # status.forward = c.read_tag(['EM05_ConveyorAxis_CD.Sts_Motion_FWD'])[0][1]
        # status.backward = c.read_tag(['EM05_ConveyorAxis_CD.Sts_Motion_REV'])[0][1]
        # status.ip = c.read_tag(['EM05_ConveyorAxis_CD.Sts_IP'])[0][1]
        # pub.publish(status)
        rate.sleep()


if __name__ == "__main__":
    try:
        main()
    except rospy.ROSInterruptException:
        print("ros interrupt exception")
