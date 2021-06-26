import rclpy
from rclpy.node import Node
from machines.msg import Sensor,Scanner,MAMstatus
from std_msgs.msg import String
from pycomm3 import LogixDriver 
import time

class MinimalPublisher(Node):

    def __init__(self):
        super().__init__('onScanner')
        self.subscription = self.create_subscription(MAMstatus ,'status/zaxis',self.callback,10)
        self.subscription
        
        self.pub = self.create_publisher(Scanner, 'status/scanner_on', 10)
        timer_period = 0.01  # seconds
        self.timer = self.create_timer(timer_period, self.timer_callback)
        

    def callback(self,data):
        print("hello")
        c = LogixDriver('10.226.52.171')
        
        print(data.position)
        
        if data.position > 178.0:
            c.open()
            c.write(('Ros_test',1))
            c.write(('send_to_micrologix[0]', 32), ('send_to_micrologix[1]',0), ('send_to_micrologix[2]',55))
            print('scanner on')
            time.sleep(30) 
            #c.write(('Ros_test',0))
            c.close()
        else:
            print("unable to on scanner")

        
       
        
    
    def timer_callback(self):
        status = Scanner()
        c = LogixDriver('10.226.52.171')
        c.open()
        print('connected')
        #print(c.read('send_to_micrologix[0]'))
        #print(c.read('send_to_micrologix[1]'))
        #print(c.read('send_to_micrologix[2]'))

        status.data1 = c.read('send_to_micrologix[0]')[1]
        status.data2 = c.read('send_to_micrologix[1]')[1]
        status.data3 = c.read('send_to_micrologix[2]')[1]
        
        
        print(status.data1)    
        #self.pub.publish(status)         
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