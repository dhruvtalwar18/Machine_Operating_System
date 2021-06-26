import rclpy
from rclpy.node import Node
from machines.msg import MAMcmd,MAMstatus
from std_msgs.msg import String
from pycomm3 import LogixDriver 
import time
from math import floor,ceil


class MinimalPublisher(Node):

    def __init__(self):
        super().__init__('reset_y_axis')
        self.subscription = self.create_subscription(MAMstatus ,'status/zaxis',self.callback,10)
        self.subscription
        self.pub = self.create_publisher(MAMstatus, 'current_status/yaxis', 10)
        timer_period = 0.01  # seconds
        self.timer = self.create_timer(timer_period, self.timer_callback)
        

    def callback(self,data):
        print(data.position )
        pass
        
        
    def timer_callback(self):
        status = MAMstatus()
        c = LogixDriver('10.226.52.171')
        c.open()
        print('connected') 
        print(c.read('Y_Ros_Start'))  

        
        c.write(('Y_mov_type', 0), ('Ros_Position', -1), ('Ros_Speed', 6))
        c.write('Y_Ros_Start' , 1)
       
        
        status.position = c.read('EM02_YAxis_CD.ActualPosition')[1]
        status.engage = bool(c.read('Y_Axis_Ros.EN')[1])
        status.done = bool(c.read('Y_Axis_Ros.DN')[1])
        status.error = bool(c.read('Y_Axis_Ros.ER')[1])
        status.inprocess = bool(c.read('Y_Axis_Ros.IP')[1])
        status.complete = bool(c.read('Y_Axis_Ros.PC')[1])
        self.pub.publish(status)
         
        print(status)
        c.close()     
        


def mainy(args=None):
    #rclpy.init(args=args)

    minimal_publisher = MinimalPublisher()

    rclpy.spin(minimal_publisher)

    minimal_publisher.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    mainy()