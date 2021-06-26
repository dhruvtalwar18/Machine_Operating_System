import rclpy
from rclpy.node import Node
from machines.msg import MAMcmd,MAMstatus
from std_msgs.msg import String
from pycomm3 import LogixDriver 
import time
from math import floor,ceil


class MinimalPublisher(Node):

    def __init__(self):
        super().__init__('reset_z_axis')
        self.subscription = self.create_subscription(MAMstatus ,'status/zaxis',self.callback,10)
        self.subscription
        self.pub = self.create_publisher(MAMstatus, 'current_status/zaxis', 10)
        timer_period = 0.01  # seconds
        self.timer = self.create_timer(timer_period, self.timer_callback)
        

    def callback(self,data):
        print(data.position )
        position = floor(data.position) + 1
        print(position)
        c = LogixDriver('10.226.52.171')
        #c.open() 
        print('hello')
        if data.position > 55:
            c.open()
            c.write(('Z_mov_type', 0), ('Z_Ros_Position', 50), ('Z_Ros_Speed', 5))
            print("1")
            c.write('Z_Ros_Start' , 1)
            print("2")
            time.sleep( 2 )
            print('executed') 
            c.close() 
        else :
            print('not executed')   
        
    def timer_callback(self):
        status = MAMstatus()
        c = LogixDriver('10.226.52.171')
        c.open()
        print('connected') 
        print(c.read('Z_Ros_Start'))  

        
        
        status.position = c.read('EM03_ZAxis_CD.ActualPosition')[1]
        status.engage = bool(c.read('Z_Axis_Ros.EN')[1])
        status.done = bool(c.read('Z_Axis_Ros.DN')[1])
        status.error = bool(c.read('Z_Axis_Ros.ER')[1])
        status.inprocess = bool(c.read('Z_Axis_Ros.IP')[1])
        status.complete = bool(c.read('Z_Axis_Ros.PC')[1])
        self.pub.publish(status)
         
        print(status)
        c.close()     
        


def main(args=None):
    rclpy.init(args=args)

    minimal_publisher = MinimalPublisher()

    rclpy.spin(minimal_publisher)

    minimal_publisher.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()