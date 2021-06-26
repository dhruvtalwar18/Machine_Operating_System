;; Auto-generated. Do not edit!


(when (boundp 'machines::Pneumatic)
  (if (not (find-package "MACHINES"))
    (make-package "MACHINES"))
  (shadow 'Pneumatic (find-package "MACHINES")))
(unless (find-package "MACHINES::PNEUMATIC")
  (make-package "MACHINES::PNEUMATIC"))

(in-package "ROS")
;;//! \htmlinclude Pneumatic.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass machines::Pneumatic
  :super ros::object
  :slots (_header _extended _retracted ))

(defmethod machines::Pneumatic
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:extended __extended) nil)
    ((:retracted __retracted) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _extended __extended)
   (setq _retracted __retracted)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:extended
   (&optional __extended)
   (if __extended (setq _extended __extended)) _extended)
  (:retracted
   (&optional __retracted)
   (if __retracted (setq _retracted __retracted)) _retracted)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _extended
    1
    ;; bool _retracted
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _extended
       (if _extended (write-byte -1 s) (write-byte 0 s))
     ;; bool _retracted
       (if _retracted (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _extended
     (setq _extended (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _retracted
     (setq _retracted (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get machines::Pneumatic :md5sum-) "ad7412a4ce4ce9d701792d492f6c3758")
(setf (get machines::Pneumatic :datatype-) "machines/Pneumatic")
(setf (get machines::Pneumatic :definition-)
      "Header header
bool extended
bool retracted
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



(provide :machines/Pneumatic "ad7412a4ce4ce9d701792d492f6c3758")


