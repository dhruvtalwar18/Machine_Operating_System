
(cl:in-package :asdf)

(defsystem "machines-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Conveyorcmd" :depends-on ("_package_Conveyorcmd"))
    (:file "_package_Conveyorcmd" :depends-on ("_package"))
    (:file "Conveyorstatus" :depends-on ("_package_Conveyorstatus"))
    (:file "_package_Conveyorstatus" :depends-on ("_package"))
    (:file "MAMcmd" :depends-on ("_package_MAMcmd"))
    (:file "_package_MAMcmd" :depends-on ("_package"))
    (:file "MAMstatus" :depends-on ("_package_MAMstatus"))
    (:file "_package_MAMstatus" :depends-on ("_package"))
    (:file "Pneumatic" :depends-on ("_package_Pneumatic"))
    (:file "_package_Pneumatic" :depends-on ("_package"))
    (:file "Scan" :depends-on ("_package_Scan"))
    (:file "_package_Scan" :depends-on ("_package"))
    (:file "Sensor" :depends-on ("_package_Sensor"))
    (:file "_package_Sensor" :depends-on ("_package"))
  ))