# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'mos_input.ui'
#
# Created by: PyQt5 UI code generator 5.14.1
#
# WARNING! All changes made in this file will be lost!


from PyQt5 import QtCore, QtGui, QtWidgets
import rclpy
from rclpy.node import Node
from machines.msg import MAMstatus , MAMcmd
from std_msgs.msg import String
import time
from reset_z import *
from reset_x import *
from reset_y import *
from pycomm3 import LogixDriver 

var = ''
class Ui_MainWindow(object):
    def get_xaxis_data(self):
        status = MAMstatus()
        c = LogixDriver('10.226.52.171')
        c.open()
        var = c.read('EM01_XAxis_CD.ActualPosition')[1]
        print("Position of X is :" ,var)
        return var
        c.close()
    
    def setupUi(self, MainWindow):

        c = LogixDriver('10.226.52.171')
        c.open()
        #var = ''
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(800, 600)
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        ####----------- start of data viewing---------#######
        self.listWidget = QtWidgets.QListWidget(self.centralwidget)
        self.listWidget.setGeometry(QtCore.QRect(480, 270, 150, 31))
        self.listWidget.setObjectName("listWidget")
        self.label_8 = QtWidgets.QLabel(self.centralwidget)
        self.label_8.setGeometry(QtCore.QRect(400, 280, 91, 17))
        self.label_8.setObjectName("label_2")
        self.pushButton_8 = QtWidgets.QPushButton(self.centralwidget)
        self.pushButton_8.setGeometry(QtCore.QRect(640, 270, 131, 25))
        self.pushButton_8.setObjectName("pushButton")
        self.pushButton_8.clicked.connect(self.get_xaxis_data)
        #self.listWidget.addItem(str(c.read('EM01_XAxis_CD.ActualPosition')[1]))
        self.listWidget.addItem(var)


        self.listWidget_2 = QtWidgets.QListWidget(self.centralwidget)
        self.listWidget_2.setGeometry(QtCore.QRect(480, 320, 150, 31))
        self.listWidget_2.setObjectName("listWidget_2")
        self.listWidget_2.addItem(str(c.read('EM02_YAxis_CD.ActualPosition')[1]))
        self.label_9 = QtWidgets.QLabel(self.centralwidget)
        self.label_9.setGeometry(QtCore.QRect(400, 330, 91, 17))
        self.label_9.setObjectName("label_3")
        self.pushButton_9 = QtWidgets.QPushButton(self.centralwidget)
        self.pushButton_9.setGeometry(QtCore.QRect(640, 320, 131, 25))
        self.pushButton_9.setObjectName("pushButton_2")
        self.pushButton_9.clicked.connect(self.get_yaxis_data)


        self.listWidget_3 = QtWidgets.QListWidget(self.centralwidget)
        self.listWidget_3.setGeometry(QtCore.QRect(480, 370, 150, 31))
        self.listWidget_3.setObjectName("listWidget_3")
        self.listWidget_3.addItem(str(c.read('EM03_ZAxis_CD.ActualPosition')[1]))
        self.pushButton_10 = QtWidgets.QPushButton(self.centralwidget)
        self.pushButton_10.setGeometry(QtCore.QRect(640, 370, 131, 25))
        self.pushButton_10.setObjectName("pushButton_3")
        self.pushButton_10.clicked.connect(self.get_zaxis_data)
        self.label_10 = QtWidgets.QLabel(self.centralwidget)
        self.label_10.setGeometry(QtCore.QRect(400, 380, 91, 17))
        self.label_10.setObjectName("label_4")
        ##########---start of data input---#########
        self.lineEdit = QtWidgets.QLineEdit(self.centralwidget)
        self.lineEdit.setGeometry(QtCore.QRect(270, 170, 113, 25))
        self.lineEdit.setObjectName("lineEdit")
        self.lineEdit_2 = QtWidgets.QLineEdit(self.centralwidget)
        self.lineEdit_2.setGeometry(QtCore.QRect(270, 230, 113, 25))
        self.lineEdit_2.setObjectName("lineEdit_2")
        self.lineEdit_3 = QtWidgets.QLineEdit(self.centralwidget)
        self.lineEdit_3.setGeometry(QtCore.QRect(270, 290, 113, 25))
        self.lineEdit_3.setObjectName("lineEdit_3")
        self.pushButton = QtWidgets.QPushButton(self.centralwidget)
        self.pushButton.setGeometry(QtCore.QRect(275, 330, 89, 25))
        self.pushButton.setObjectName("pushButton")

        self.pushButton.clicked.connect(self.getdata)

        self.pushButton_2 = QtWidgets.QPushButton(self.centralwidget)
        self.pushButton_2.setGeometry(QtCore.QRect(500, 50, 200, 25))
        self.pushButton_2.setObjectName("pushButton_2")
        self.pushButton_2.clicked.connect(self.resetx)

        self.pushButton_3 = QtWidgets.QPushButton(self.centralwidget)
        self.pushButton_3.setGeometry(QtCore.QRect(500, 100, 200, 25))
        self.pushButton_3.setObjectName("pushButton_3")
        self.pushButton_3.clicked.connect(self.resetz)

        self.pushButton_4 = QtWidgets.QPushButton(self.centralwidget)
        self.pushButton_4.setGeometry(QtCore.QRect(500, 150, 200, 25))
        self.pushButton_4.setObjectName("pushButton_4")
        self.pushButton_4.clicked.connect(self.resety)

        self.label = QtWidgets.QLabel(self.centralwidget)
        self.label.setGeometry(QtCore.QRect(120, 170, 131, 20))
        self.label.setObjectName("label")
        self.label_2 = QtWidgets.QLabel(self.centralwidget)
        self.label_2.setGeometry(QtCore.QRect(120, 230, 111, 20))
        self.label_2.setObjectName("label_2")
        self.label_3 = QtWidgets.QLabel(self.centralwidget)
        self.label_3.setGeometry(QtCore.QRect(120, 290, 111, 20))
        self.label_3.setObjectName("label_3")
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 800, 22))
        self.menubar.setObjectName("menubar")
        self.menuMachine_Operating_System = QtWidgets.QMenu(self.menubar)
        self.menuMachine_Operating_System.setObjectName("menuMachine_Operating_System")
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(MainWindow)
        self.statusbar.setObjectName("statusbar")
        MainWindow.setStatusBar(self.statusbar)
        self.menubar.addAction(self.menuMachine_Operating_System.menuAction())

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "MainWindow"))
        self.pushButton.setText(_translate("MainWindow", "Send data"))
        self.pushButton_2.setText(_translate("MainWindow", "Reset X axis"))
        self.pushButton_3.setText(_translate("MainWindow", "Reset Z axis"))
        self.pushButton_4.setText(_translate("MainWindow", "Reset Y axis"))
        self.label.setText(_translate("MainWindow", "Enter Move Type"))
        self.label_2.setText(_translate("MainWindow", "Enter X position"))
        self.label_3.setText(_translate("MainWindow", "Enter Z position"))
        ####----start of viewing of data ------########
        self.label_8.setText(_translate("MainWindow", "X Axis Data"))
        self.pushButton_8.setText(_translate("MainWindow", "Get Live Position"))
        self.label_9.setText(_translate("MainWindow", "Y Axis Data"))
        self.pushButton_9.setText(_translate("MainWindow", "Get Live Position"))
        self.pushButton_10.setText(_translate("MainWindow", "Get Live Position"))
        self.label_10.setText(_translate("MainWindow", "Z Axis Data"))

        self.menuMachine_Operating_System.setTitle(_translate("MainWindow", "Machine Operating System"))

   

    def getdata(self):
        data1 = self.lineEdit.text() # Get the value of the lineEdit        
        print(data1)

        data2 = self.lineEdit_2.text()
        print(data2)

        data3 = self.lineEdit_3.text()
        print(data3)
        
        return data1,data2,data3 

    def resetz(self):
        mainz()

    def resetx(self):
        mainx()

    def resety(self):
        mainy()

        
    
    def get_xaxis_data(self):
        status = MAMstatus()
        c = LogixDriver('10.226.52.171')
        c.open()
        var = c.read('EM01_XAxis_CD.ActualPosition')[1]
        print("Position of X is :" ,var)
        return var
        c.close()

    def get_yaxis_data(self):
        status = MAMstatus()
        c = LogixDriver('10.226.52.171')
        c.open()
        var = c.read('EM02_YAxis_CD.ActualPosition')[1]
        print("Position of Y is :" ,var)
        return var
        c.close()

    def get_zaxis_data(self):
        status = MAMstatus()
        c = LogixDriver('10.226.52.171')
        c.open()
        var = c.read('EM03_ZAxis_CD.ActualPosition')[1]
        print("Position of Z is :" ,var)
        return var
        c.close()

             

         
        
        

        
        
        

class MinimalPublisher(Node):    

    def __init__(self,ui):
        super().__init__('control_z')
        self.pubz = self.create_publisher(MAMcmd, 'control/zaxis', 10)
        self.pubx = self.create_publisher(MAMcmd, 'control/xaxis', 10)
        self.puby = self.create_publisher(MAMcmd, 'control/yaxis', 10)
        timer_period = 0.01  # seconds
        self.timer = self.create_timer(timer_period, self.timer_callback)
        self.ui_mainwindow = ui
        # print(self.ui_mainwindow)   
    

    def timer_callback(self):
        controlz = MAMcmd()
        controlx = MAMcmd()
        controly = MAMcmd()
        print('loading all data from UI Main window')
        # mtype_temp,posx,posy=self.ui_mainwindow.getdata()
        # while mtype_temp=='' or posx=='' or posy =='':
        temp= input('give input')
        print(temp)
        mtype_temp,posx,posy= self.ui_mainwindow.getdata()        
        posz=0
        print(mtype_temp)
        print(posx)
        print(posy)
        print(posz)
        print('All variables retrived')
        # mtype = input("enter move type 0 for absolute  , 1 for relative = ")
        mtype_int = int(mtype_temp,8)
        positionx = float(posx)
        positiony = float(posy)
        positionz = float(posz)
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

def main(ui,args=None):
    rclpy.init(args=args)

    mm = MinimalPublisher(ui)

    rclpy.spin(mm)
    
    mm.destroy_node()
    rclpy.shutdown()

     
    
    
    
if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    MainWindow = QtWidgets.QMainWindow()

    ui = Ui_MainWindow()
    ui.setupUi(MainWindow)
    MainWindow.show()
    
    main(ui)
    
    sys.exit(app.exec_())
