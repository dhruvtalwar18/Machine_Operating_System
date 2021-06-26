;; Auto-generated. Do not edit!


(when (boundp 'machines::Conveyorstatus)
  (if (not (find-package "MACHINES"))
    (make-package "MACHINES"))
  (shadow 'Conveyorstatus (find-package "MACHINES")))
(unless (find-package "MACHINES::CONVEYORSTATUS")
  (make-package "MACHINES::CONVEYORSTATUS"))

(in-package "ROS")
;;//! \htmlinclude Conveyorstatus.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass machines::Conveyorstatus
  :super ros::object
  :slots (_header _forward _backward _enable _error _ip ))

(defmethod machines::Conveyorstatus
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:forward __forward) 0.0)
    ((:backward __backward) 0.0)
    ((:enable __enable) 0.0)
    ((:error __error) "")
    ((:ip __ip) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _forward (float __forward))
   (setq _backward (float __backward))
   (setq _enable (float __enable))
   (setq _error (string __error))
   (setq _ip (float __ip))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:forward
   (&optional __forward)
   (if __forward (setq _forward __forward)) _forward)
  (:backward
   (&optional __backward)
   (if __backward (setq _backward __backward)) _backward)
  (:enable
   (&optional __enable)
   (if __enable (setq _enable __enable)) _enable)
  (:error
   (&optional __error)
   (if __error (setq _error __error)) _error)
  (:ip
   (&optional __ip)
   (if __ip (setq _ip __ip)) _ip)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _forward
    8
    ;; float64 _backward
    8
    ;; float64 _enable
    8
    ;; string _error
    4 (length _error)
    ;; float64 _ip
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _forward
       (sys::poke _forward (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _backward
       (sys::poke _backward (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _enable
       (sys::poke _enable (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _error
       (write-long (length _error) s) (princ _error s)
     ;; float64 _ip
       (sys::poke _ip (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _forward
     (setq _forward (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _backward
     (setq _backward (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _enable
     (setq _enable (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _error
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _error (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _ip
     (setq _ip (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get machines::Conveyorstatus :md5sum-) "8ec79f759d0ed37cd3e5cc18185cc76f")
(setf (get machines::Conveyorstatus :datatype-) "machines/Conveyorstatus")
(setf (get machines::Conveyorstatus :definition-)
      "Header header
float64 forward
float64 backward
float64 enable
string error
float64 ip
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



(provide :machines/Conveyorstatus "8ec79f759d0ed37cd3e5cc18185cc76f")


