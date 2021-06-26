# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'uidemo.ui'
#
# Created by: PyQt4 UI code generator 4.12.1
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

import rospy
from demo.msg import MAMcmd, MAMstatus
from std_msgs.msg import String
import sys
import time

value1 = 0


try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    def _fromUtf8(s):
        return s

try:
    _encoding = QtGui.QApplication.UnicodeUTF8
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig, _encoding)
except AttributeError:
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig)

class Ui_Dialog(object):

    def setupUi(self, Dialog):
        Dialog.setObjectName(_fromUtf8("Dialog"))
        Dialog.resize(400, 300)
        self.okbutton = QtGui.QDialogButtonBox(Dialog)
        self.okbutton.setGeometry(QtCore.QRect(290, 20, 81, 241))
        self.okbutton.setOrientation(QtCore.Qt.Vertical)
        self.okbutton.setStandardButtons(QtGui.QDialogButtonBox.Cancel|QtGui.QDialogButtonBox.Ok)
        self.okbutton.setObjectName(_fromUtf8("okbutton"))
        self.lineEdit = QtGui.QLineEdit(Dialog)
        self.lineEdit.setGeometry(QtCore.QRect(60, 140, 191, 25))
        self.lineEdit.setText(_fromUtf8(""))
        self.lineEdit.setObjectName(_fromUtf8("lineEdit"))

        #self.okbutton.clicked.connect(self.getvalue)


        #self.value1=0
        #value = self.lineEdit.text()


        self.pushButton = QtGui.QPushButton(Dialog)
        self.pushButton.setGeometry(QtCore.QRect(270, 140, 89, 25))
        self.pushButton.setObjectName(_fromUtf8("pushButton"))
        self.pushButton.clicked.connect(self.addItem)

        try:
            _encoding = QtGui.QApplication.UnicodeUTF8
            def _translate(context, text, disambig):
                return QtGui.QApplication.translate(context, text, disambig, _encoding)
        except AttributeError:
            def _translate(context, text, disambig):
                return QtGui.QApplication.translate(context, text, disambig)


        self.retranslateUi(Dialog)
        QtCore.QObject.connect(self.okbutton, QtCore.SIGNAL(_fromUtf8("accepted()")), Dialog.accept)
        QtCore.QObject.connect(self.okbutton, QtCore.SIGNAL(_fromUtf8("rejected()")), Dialog.reject)
        QtCore.QMetaObject.connectSlotsByName(Dialog)

    def retranslateUi(self, Dialog):
        Dialog.setWindowTitle(_translate("Dialog", "Dialog", None))
        self.pushButton.setText(_translate("Dialog", "Submit", None))

    def execute(self):
        global value1
        d = value1
        print(d)
        controlx = MAMcmd()
        pubx = rospy.Publisher('control/xaxis', MAMcmd, queue_size=10)
        rospy.init_node('controlz', anonymous=True)
        rate = rospy.Rate(1)
        while not rospy.is_shutdown():
            controlx.axis = str(d)
            pubx.publish(controlx)
            #rospy.loginfo(controlx)
            #print(controlx.moveType)
            rate.sleep()

    def addItem(self):
        global value1
        value1 = self.lineEdit.text() # Get the value of the lineEdit
        self.lineEdit.clear() # Clear the text
        print(value1)
        #return value1
        ui.execute()


if __name__ == '__main__':
    app = QtGui.QApplication(sys.argv)
    Dialog = QtGui.QDialog()
    ui = Ui_Dialog()

    ui.setupUi(Dialog)
    print("1")
    Dialog.show()
    print("hi")
    #time.sleep(5)
    #ui.execute()
    print("2")
    sys.exit(app.exec_())
    print("3")





