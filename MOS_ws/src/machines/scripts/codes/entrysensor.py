import rclpy
from rclpy.node import Node
from machines.msg import Sensor
from std_msgs.msg import String
from pycomm3 import LogixDriver 
import time

class MinimalPublisher(Node):

    def __init__(self):
        super().__init__('entrysensor')
        
        self.pub = self.create_publisher(Sensor, 'status/entrysensor', 10)
        timer_period = 0.01  # seconds
        self.timer = self.create_timer(timer_period, self.timer_callback)
        

    def callback(self,data):
        pass      
        
       
        
    
    def timer_callback(self):
        status = Sensor()
        c = LogixDriver('10.226.52.171')
        c.open()
        print('connected')
        status.data = c.read('send_to_micrologix[0]')[1] 
        
        
        print(status.data)    
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
