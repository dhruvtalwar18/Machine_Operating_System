; Auto-generated. Do not edit!


(cl:in-package machines-msg)


;//! \htmlinclude MAMcmd.msg.html

(cl:defclass <MAMcmd> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (moveType
    :reader moveType
    :initarg :moveType
    :type cl:fixnum
    :initform 0)
   (position
    :reader position
    :initarg :position
    :type cl:float
    :initform 0.0)
   (speed
    :reader speed
    :initarg :speed
    :type cl:float
    :initform 0.0))
)

(cl:defclass MAMcmd (<MAMcmd>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MAMcmd>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MAMcmd)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name machines-msg:<MAMcmd> is deprecated: use machines-msg:MAMcmd instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MAMcmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader machines-msg:header-val is deprecated.  Use machines-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'moveType-val :lambda-list '(m))
(cl:defmethod moveType-val ((m <MAMcmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader machines-msg:moveType-val is deprecated.  Use machines-msg:moveType instead.")
  (moveType m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <MAMcmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader machines-msg:position-val is deprecated.  Use machines-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <MAMcmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader machines-msg:speed-val is deprecated.  Use machines-msg:speed instead.")
  (speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MAMcmd>) ostream)
  "Serializes a message object of type '<MAMcmd>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'moveType)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MAMcmd>) istream)
  "Deserializes a message object of type '<MAMcmd>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'moveType) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MAMcmd>)))
  "Returns string type for a message object of type '<MAMcmd>"
  "machines/MAMcmd")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MAMcmd)))
  "Returns string type for a message object of type 'MAMcmd"
  "machines/MAMcmd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MAMcmd>)))
  "Returns md5sum for a message object of type '<MAMcmd>"
  "c39cd77a9e5a7c6e85eaa353b3540f2c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MAMcmd)))
  "Returns md5sum for a message object of type 'MAMcmd"
  "c39cd77a9e5a7c6e85eaa353b3540f2c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MAMcmd>)))
  "Returns full string definition for message of type '<MAMcmd>"
  (cl:format cl:nil "Header header~%# string axis~%# string tag~%int8 moveType~%float64 position~%float64 speed~%# float64 accel~%# float64 decel~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MAMcmd)))
  "Returns full string definition for message of type 'MAMcmd"
  (cl:format cl:nil "Header header~%# string axis~%# string tag~%int8 moveType~%float64 position~%float64 speed~%# float64 accel~%# float64 decel~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MAMcmd>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MAMcmd>))
  "Converts a ROS message object to a list"
  (cl:list 'MAMcmd
    (cl:cons ':header (header msg))
    (cl:cons ':moveType (moveType msg))
    (cl:cons ':position (position msg))
    (cl:cons ':speed (speed msg))
))
