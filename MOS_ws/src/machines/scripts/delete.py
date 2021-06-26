from opcua import Client, ua

client = Client("opc.tcp://10.226.52.227:4994")
client.connect()
cmdClampingCylnderForward= client.get_node("ns=3;s=[PLC]HMI_Manual_ClampingCylinder_Forward")
cmdClampingCylnderBack= client.get_node("ns=3;s=[PLC]HMI_Manual_ClampingCylinder_Back")


cmdClampingCylnderBack.set_value(True)
cmdClampingCylnderForward.set_value(False)
print('retracted?')