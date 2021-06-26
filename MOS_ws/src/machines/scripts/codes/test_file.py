import rclpy
from rclpy.node import Node
from machines.msg import Sensor
from std_msgs.msg import String
from pycomm3 import LogixDriver 
import time

class MinimalPublisher(Node):

    def __init__(self):
        super().__init__('entrysensor')
        #self.subscription = self.create_subscription(MAMcmd ,'control/zaxis',self.callback,10)
        #self.subscription
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
        status.data = c.read('iolinkblock1:I1.Data[0].6')[1] 
        print(c.read('send_to_micrologix[0]'))
        print(c.read('send_to_micrologix[1]'))
        print(c.read('send_to_micrologix[2]'))
        #c.write(('Conveyer_block_on',0))
        #c.write(('send_to_micrologix[0]', 32), ('send_to_micrologix[1]',0), ('send_to_micrologix[2]',55))
        #c.write(('Ros_test',0))
        #c.write(('Z_mov_type', 0), ('Z_Ros_Position', 0), ('Z_Ros_Speed', 5))
        #c.write('Z_Ros_Start' , 1)
        #c.write(('Move_Type_X', 0), ('Ros_Position_X', -50), ('Ros_Speed_X', 6.0))
        #c.write('X_Ros_Start' , 1)
        print(c.read('Y_Ros_Start'))
        time.sleep(5)
        
        self.pub.publish(status)         
        #print(status)
        c.close()     
        


def main(args=None):
    rclpy.init(args=args)

    minimal_publisher = MinimalPublisher()

    rclpy.spin(minimal_publisher)

    minimal_publisher.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()
