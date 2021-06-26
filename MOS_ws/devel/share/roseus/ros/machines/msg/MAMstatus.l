;; Auto-generated. Do not edit!


(when (boundp 'machines::MAMstatus)
  (if (not (find-package "MACHINES"))
    (make-package "MACHINES"))
  (shadow 'MAMstatus (find-package "MACHINES")))
(unless (find-package "MACHINES::MAMSTATUS")
  (make-package "MACHINES::MAMSTATUS"))

(in-package "ROS")
;;//! \htmlinclude MAMstatus.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass machines::MAMstatus
  :super ros::object
  :slots (_header _engage _done _error _inProcess _complete _position ))

(defmethod machines::MAMstatus
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:engage __engage) nil)
    ((:done __done) nil)
    ((:error __error) nil)
    ((:inProcess __inProcess) nil)
    ((:complete __complete) nil)
    ((:position __position) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _engage __engage)
   (setq _done __done)
   (setq _error __error)
   (setq _inProcess __inProcess)
   (setq _complete __complete)
   (setq _position (float __position))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:engage
   (&optional __engage)
   (if __engage (setq _engage __engage)) _engage)
  (:done
   (&optional __done)
   (if __done (setq _done __done)) _done)
  (:error
   (&optional __error)
   (if __error (setq _error __error)) _error)
  (:inProcess
   (&optional __inProcess)
   (if __inProcess (setq _inProcess __inProcess)) _inProcess)
  (:complete
   (&optional __complete)
   (if __complete (setq _complete __complete)) _complete)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _engage
    1
    ;; bool _done
    1
    ;; bool _error
    1
    ;; bool _inProcess
    1
    ;; bool _complete
    1
    ;; float64 _position
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _engage
       (if _engage (write-byte -1 s) (write-byte 0 s))
     ;; bool _done
       (if _done (write-byte -1 s) (write-byte 0 s))
     ;; bool _error
       (if _error (write-byte -1 s) (write-byte 0 s))
     ;; bool _inProcess
       (if _inProcess (write-byte -1 s) (write-byte 0 s))
     ;; bool _complete
       (if _complete (write-byte -1 s) (write-byte 0 s))
     ;; float64 _position
       (sys::poke _position (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _engage
     (setq _engage (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _done
     (setq _done (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _error
     (setq _error (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _inProcess
     (setq _inProcess (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _complete
     (setq _complete (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _position
     (setq _position (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get machines::MAMstatus :md5sum-) "14b63e6a6cf35762331b707484ff880e")
(setf (get machines::MAMstatus :datatype-) "machines/MAMstatus")
(setf (get machines::MAMstatus :definition-)
      "Header header
bool engage
bool done
bool error
bool inProcess
bool complete
float64 position
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



(provide :machines/MAMstatus "14b63e6a6cf35762331b707484ff880e")


