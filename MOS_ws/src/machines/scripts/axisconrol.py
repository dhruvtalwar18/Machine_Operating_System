import rclpy
from rclpy.node import Node
from machines.msg import MAMstatus , MAMcmd
from std_msgs.msg import String
import time





class MinimalPublisher(Node):
    

    def __init__(self):
        super().__init__('control_z')
        self.pubz = self.create_publisher(MAMcmd, 'control/zaxis', 10)
        self.pubx = self.create_publisher(MAMcmd, 'control/xaxis', 10)
        self.puby = self.create_publisher(MAMcmd, 'control/yaxis', 10)
        timer_period = 0.01  # seconds
        self.timer = self.create_timer(timer_period, self.timer_callback)
        

    def timer_callback(self):
        controlz = MAMcmd()
        controlx = MAMcmd()
        controly = MAMcmd()

        mtype = input("enter move type 0 for absolute  , 1 for relative = ")
        mtype_int = int(mtype,8)
        positionx = float(input("enter position for x = "))
        positiony = float(input("enter position for y = "))
        positionz = float(input("enter position for z = "))
        #speedz = int(input("enter speed for z = "))

        speed_float = 10.0
        speed_int = 1

        controly.movetype = mtype_int
        controly.position = positiony
        controly.speed = speed_float

        controlx.movetype = mtype_int
        controlx.position = positionx
        controlx.speed = speed_float

        controlz.movetype = mtype_int
        controlz.position = positionz
        controlz.speed = speed_float 

        self.pubx.publish(controlx)
        self.puby.publish(controly)
        self.pubz.publish(controlz)

        print("published")

        #self.get_logger().info(controlx.movetype)
        #self.get_logger().info(controlz.position)        


def main(args=None):
    rclpy.init(args=args)

    mm = MinimalPublisher()

    rclpy.spin(mm)
    
    mm.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()