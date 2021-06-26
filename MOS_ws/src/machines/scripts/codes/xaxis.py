import rclpy
from rclpy.node import Node
from machines.msg import MAMcmd,MAMstatus
from std_msgs.msg import String
from pycomm3 import LogixDriver 
import time


class MinimalPublisher(Node):

    def __init__(self):
        super().__init__('xaxis')
        self.subscription = self.create_subscription(MAMcmd,'control/xaxis',self.callback,10)
        self.subscription
        self.pub = self.create_publisher(MAMstatus, 'status/xaxis', 10)
        timer_period = 0.01  # seconds
        self.timer = self.create_timer(timer_period, self.timer_callback)
        

    def callback(self,data):
        print(data.position , data.movetype , data.speed)
        c = LogixDriver('10.226.52.171')
        c.open()
        c.write(('Move_Type_X', data.movetype), ('Ros_Position_X', -185), ('Ros_Speed_X', 6.0))
        c.write('X_Ros_Start' , 1)
        time.sleep( 5 )
        #c.write('X_Ros_Start' , 0)
        c.close()
        print('executed')
        
    
    def timer_callback(self):
        status = MAMstatus()
        c = LogixDriver('10.226.52.171')
        c.open()
        #print('connected')       
        status.position = c.read('EM01_XAxis_CD.ActualPosition')[1]
        status.engage = bool(c.read('X_Axis_Ros.EN')[1])
        status.done = bool(c.read('X_Axis_Ros.DN')[1])
        status.error = bool(c.read('X_Axis_Ros.ER')[1])
        status.inprocess = bool(c.read('X_Axis_Ros.IP')[1])
        status.complete = bool(c.read('X_Axis_Ros.PC')[1])
        print(c.read('X_Ros_Start'))
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
