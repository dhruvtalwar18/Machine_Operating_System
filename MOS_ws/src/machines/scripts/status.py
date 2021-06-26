#!/usr/bin/env python

import rospy
from opcua import Client, ua
# from std_msgs.msg import String
from machines.msg import Status
import sys
# import logging
import time

# <---------------------------------- error handling
def error_handling(block):
  return 'Retrying {}. {}. {}, line: {}'.format(block, sys.exc_info()[0], sys.exc_info()[1], sys.exc_info()[2].tb_lineno)
# ------------------------------------------>

# <----------------------- machine URLS
stn1url = "opc.tcp://10.226.52.227:4994"
#kepurl = "opc.tcp://10.226.52.227:49320"
stn2url = "opc.tcp://10.226.52.243:4842/ua"
stn3url = "opc.tcp://10.226.52.62:4840/ua"
kukaurl = "opc.tcp://10.226.52.128:4840"
# -------------------------------------->

client1 = Client(stn1url)
# client2 = Client(stn2url)
# client3 = Client(stn3url)
# client4 = Client(kukaurl)

# <----------------------------------Station One Variables-------------- 

StoppingCylinder1_up = ''
StoppingCylinder1_down = ''

Gripper1_PositionX = ''
Gripper1_PositionY = ''
Gripper1_PositionZ = ''
Rotary_Position = ''

PalletReleaseCylinder1_Up = ''
PalletReleaseCylinder1_Down = ''

PalletClampingCylinder1_Back = ''
PalletClampingCylinder1_Forward = ''

MotorCylinder1_Back = ''
MotorCylinder1_Forward = ''

Gripper1_Open = ''
Gripper1_Close = ''

PalletLockingCylinder1_Up = ''
PalletLockingCylinder1_Down = ''

# <------------ connecting to servers
def connectMachineOne():

  global StoppingCylinder1_up
  global StoppingCylinder1_down

  global Gripper1_PositionX
  global Gripper1_PositionY
  global Gripper1_PositionZ

  global PalletReleaseCylinder1_Up
  global PalletReleaseCylinder1_Down 

  global Gripper1_Open
  global Gripper1_Close
  
  global PalletLockingCylinder1_Down
  global PalletClampingCylinder1_Forward

  global MotorCylinder1_Back
  global MotorCylinder1_Forward
  
  global PalletLockingCylinder1_Up
  global PalletClampingCylinder1_Back

  global Rotary_Position

  while True:
    try:

      client1.connect()
      print('machine 1 connected')

      # opcua nodes for RoS
      PalletLockingCylinder1_Down = client1.get_node("ns=3;s=::[PLC]aentr:1:I.6")
    #   PalletLockingCylinder1_Up = client1.get_node("ns=3;s=::[PLC]aentr:1:I.0")

      PalletClampingCylinder1_Forward = client1.get_node("ns=3;s=::[PLC]aentr:1:I.7")
    #   PalletClampingCylinder1_Back = client1.get_node("ns=3;s=::[PLC]aentr:2:I.3")

    #   StoppingCylinder1_down = client1.get_node("ns=3;s=::[PLC]aentr:1:I.2")
      StoppingCylinder1_up = client1.get_node("ns=3;s=::[PLC]aentr:1:I.0")

      PalletReleaseCylinder1_Up = client1.get_node("ns=3;s=::[PLC]aentr:1:I.3")
    #   PalletReleaseCylinder1_Down = client1.get_node("ns=3;s=::[PLC]aentr:1:I.4")

      MotorCylinder1_Back = client1.get_node("ns=3;s=::[PLC]aentr:1:I.5")
    #   MotorCylinder1_Forward = client1.get_node("ns=3;s=::[PLC]aentr:1:I.1")

      Gripper1_Open = client1.get_node("ns=3;s=::[PLC]aentr:2:I.2")
    #   Gripper1_Close = client1.get_node("ns=3;s=::[PLC]aentr:2:I.0")

      Gripper1_PositionX = client1.get_node("ns=3;s=[PLC]EM01_XAxis_CD.ActualPosition")
      Gripper1_PositionY = client1.get_node("ns=3;s=[PLC]EM02_YAxis_CD.ActualPosition")
      Gripper1_PositionZ = client1.get_node("ns=3;s=[PLC]EM03_ZAxis_CD.ActualPosition")
      Rotary_Position = client1.get_node("ns=3;s=[PLC]EM04_RotaryAxis_CD.ActualPosition")



      # FaceOne = client1.get_node("ns=3;s=[PLC]Face1_matched")
      # FaceTwo = client1.get_node("ns=3;s=[PLC]Face2_matched")
      # FaceThree = client1.get_node("ns=3;s=[PLC]Face3_matched")
      # FaceFour = client1.get_node("ns=3;s=[PLC]Face4_matched")

    except:
      print(error_handling("retrying server 1 block"))
      
    else:
      break

# Main Block
def main():
  data = Status()
  # 
  pub = rospy.Publisher('status', Status, queue_size=10)
  rospy.init_node('rosOpcuaAdapter', anonymous=True)
  rate = rospy.Rate(1)

  connectMachineOne()
  print("All Stations connected")
  while not rospy.is_shutdown():
    data.header.frame_id = 'm1_status'
    data.header.stamp = rospy.Time.now()
    data.locking = PalletLockingCylinder1_Down.get_value()
    data.clamping = PalletClampingCylinder1_Forward.get_value()
    data.stopping = StoppingCylinder1_up.get_value()
    data.release = PalletReleaseCylinder1_Up.get_value()
    data.motor = MotorCylinder1_Back.get_value() 
    data.gripper = Gripper1_Open.get_value()
    data.x = Gripper1_PositionX.get_value()
    data.y = Gripper1_PositionY.get_value()
    data.z = Gripper1_PositionZ.get_value()
    data.scan = Rotary_Position.get_value()
    pub.publish(data)
    rate.sleep()

if __name__ == '__main__':
  try:
    main()
    # connectMachineOne()
    # print(PalletLockingCylinder1_Up.get_value())
    # print(PalletClampingCylinder1_Back.get_value())
    # print(StoppingCylinder1_up.get_value())
    # print(PalletReleaseCylinder1_Down.get_value())
    # print(MotorCylinder1_Forward.get_value())
    # print(Gripper1_Close.get_value())
    # print(Gripper1_PositionX.get_value())
    # print(Gripper1_PositionY.get_value())
    # print(Gripper1_PositionZ.get_value())


  except rospy.ROSInterruptException:
    print('disconnected and exiting')