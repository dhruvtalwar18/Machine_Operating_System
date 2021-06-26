
from opcua import Client, ua

class Machine:
    nodes = []
    def __init__(self, name, url, array):
        self.name = name
        self.url = url
        self.array = array
        self.client = Client(self.url)

    def opcuaconnect(self):
        self.client.connect()
        print('connected machine {}'.format(self.name))

    def opcuadisconnect(self):
        self.client.disconnect()
        print('disconnected machine {}'.format(self.name))

    def connectNode(self):
        
        for i in range(len(self.array)):
            self.client.connect()
            node = self.array[i]
            name = node['name']
            address = node['address']
            data = self.client.get_node(address)
            add = {'name': name, 'data': data}
            Machine.nodes.append(add)
            self.client.disconnect()

        
a = [{'name': 'Gripper1_Open', 'address': 'ns=3;s=::[PLC]aentr:2:I.2'},
    {'name': 'cmdGripperOpen', 'address': 'ns=3;s=[PLC]HMI_Manual_Gripper_Open'}, 
    {'name': 'cmdGripperClose', 'address': 'ns=3;s=[PLC]HMI_Manual_Gripper_Close'}]

m1 = Machine('one', "opc.tcp://10.226.52.227:4994", a)
m1.connectNode()
m1.opcuaconnect()
print(m1.nodes[0]["data"].get_value())
m1.opcuadisconnect()