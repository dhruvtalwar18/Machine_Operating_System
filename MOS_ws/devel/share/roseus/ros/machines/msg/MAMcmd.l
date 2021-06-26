;; Auto-generated. Do not edit!


(when (boundp 'machines::MAMcmd)
  (if (not (find-package "MACHINES"))
    (make-package "MACHINES"))
  (shadow 'MAMcmd (find-package "MACHINES")))
(unless (find-package "MACHINES::MAMCMD")
  (make-package "MACHINES::MAMCMD"))

(in-package "ROS")
;;//! \htmlinclude MAMcmd.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass machines::MAMcmd
  :super ros::object
  :slots (_header _moveType _position _speed ))

(defmethod machines::MAMcmd
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:moveType __moveType) 0)
    ((:position __position) 0.0)
    ((:speed __speed) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _moveType (round __moveType))
   (setq _position (float __position))
   (setq _speed (float __speed))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:moveType
   (&optional __moveType)
   (if __moveType (setq _moveType __moveType)) _moveType)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int8 _moveType
    1
    ;; float64 _position
    8
    ;; float64 _speed
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int8 _moveType
       (write-byte _moveType s)
     ;; float64 _position
       (sys::poke _position (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int8 _moveType
     (setq _moveType (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _moveType 127) (setq _moveType (- _moveType 256)))
   ;; float64 _position
     (setq _position (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _speed
     (setq _speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get machines::MAMcmd :md5sum-) "c39cd77a9e5a7c6e85eaa353b3540f2c")
(setf (get machines::MAMcmd :datatype-) "machines/MAMcmd")
(setf (get machines::MAMcmd :definition-)
      "Header header
# string axis
# string tag
int8 moveType
float64 position
float64 speed
# float64 accel
# float64 decel
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :machines/MAMcmd "c39cd77a9e5a7c6e85eaa353b3540f2c")


