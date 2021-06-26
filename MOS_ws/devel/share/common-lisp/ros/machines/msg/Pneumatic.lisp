; Auto-generated. Do not edit!


(cl:in-package machines-msg)


;//! \htmlinclude Pneumatic.msg.html

(cl:defclass <Pneumatic> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (extended
    :reader extended
    :initarg :extended
    :type cl:boolean
    :initform cl:nil)
   (retracted
    :reader retracted
    :initarg :retracted
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Pneumatic (<Pneumatic>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Pneumatic>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Pneumatic)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name machines-msg:<Pneumatic> is deprecated: use machines-msg:Pneumatic instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Pneumatic>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader machines-msg:header-val is deprecated.  Use machines-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'extended-val :lambda-list '(m))
(cl:defmethod extended-val ((m <Pneumatic>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader machines-msg:extended-val is deprecated.  Use machines-msg:extended instead.")
  (extended m))

(cl:ensure-generic-function 'retracted-val :lambda-list '(m))
(cl:defmethod retracted-val ((m <Pneumatic>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader machines-msg:retracted-val is deprecated.  Use machines-msg:retracted instead.")
  (retracted m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Pneumatic>) ostream)
  "Serializes a message object of type '<Pneumatic>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'extended) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'retracted) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Pneumatic>) istream)
  "Deserializes a message object of type '<Pneumatic>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'extended) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'retracted) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Pneumatic>)))
  "Returns string type for a message object of type '<Pneumatic>"
  "machines/Pneumatic")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Pneumatic)))
  "Returns string type for a message object of type 'Pneumatic"
  "machines/Pneumatic")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Pneumatic>)))
  "Returns md5sum for a message object of type '<Pneumatic>"
  "ad7412a4ce4ce9d701792d492f6c3758")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Pneumatic)))
  "Returns md5sum for a message object of type 'Pneumatic"
  "ad7412a4ce4ce9d701792d492f6c3758")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Pneumatic>)))
  "Returns full string definition for message of type '<Pneumatic>"
  (cl:format cl:nil "Header header~%bool extended~%bool retracted~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Pneumatic)))
  "Returns full string definition for message of type 'Pneumatic"
  (cl:format cl:nil "Header header~%bool extended~%bool retracted~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Pneumatic>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Pneumatic>))
  "Converts a ROS message object to a list"
  (cl:list 'Pneumatic
    (cl:cons ':header (header msg))
    (cl:cons ':extended (extended msg))
    (cl:cons ':retracted (retracted msg))
))
