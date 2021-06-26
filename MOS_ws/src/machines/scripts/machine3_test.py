import pymcprotocol
import time

#print('connected')
pymc3e = pymcprotocol.Type3E(plctype="iQ-R")
print("1")
#pymc3e.setaccessopt(commtype="binary")
if pymc3e.connect("10.226.52.60",1025):
    print('connected')
    #time.sleep(5)
else:
    print("fuck off")
#pymc3e.connect('10.226.52.60',1025)
#print(c)


