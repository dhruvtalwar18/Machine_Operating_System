; Auto-generated. Do not edit!


(cl:in-package machines-msg)


;//! \htmlinclude MAMstatus.msg.html

(cl:defclass <MAMstatus> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (engage
    :reader engage
    :initarg :engage
    :type cl:boolean
    :initform cl:nil)
   (done
    :reader done
    :initarg :done
    :type cl:boolean
    :initform cl:nil)
   (error
    :reader error
    :initarg :error
    :type cl:boolean
    :initform cl:nil)
   (inProcess
    :reader inProcess
    :initarg :inProcess
    :type cl:boolean
    :initform cl:nil)
   (complete
    :reader complete
    :initarg :complete
    :type cl:boolean
    :initform cl:nil)
   (position
    :reader position
    :initarg :position
    :type cl:float
    :initform 0.0))
)

(cl:defclass MAMstatus (<MAMstatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MAMstatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MAMstatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name machines-msg:<MAMstatus> is deprecated: use machines-msg:MAMstatus instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MAMstatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader machines-msg:header-val is deprecated.  Use machines-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'engage-val :lambda-list '(m))
(cl:defmethod engage-val ((m <MAMstatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader machines-msg:engage-val is deprecated.  Use machines-msg:engage instead.")
  (engage m))

(cl:ensure-generic-function 'done-val :lambda-list '(m))
(cl:defmethod done-val ((m <MAMstatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader machines-msg:done-val is deprecated.  Use machines-msg:done instead.")
  (done m))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <MAMstatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader machines-msg:error-val is deprecated.  Use machines-msg:error instead.")
  (error m))

(cl:ensure-generic-function 'inProcess-val :lambda-list '(m))
(cl:defmethod inProcess-val ((m <MAMstatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader machines-msg:inProcess-val is deprecated.  Use machines-msg:inProcess instead.")
  (inProcess m))

(cl:ensure-generic-function 'complete-val :lambda-list '(m))
(cl:defmethod complete-val ((m <MAMstatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader machines-msg:complete-val is deprecated.  Use machines-msg:complete instead.")
  (complete m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <MAMstatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader machines-msg:position-val is deprecated.  Use machines-msg:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MAMstatus>) ostream)
  "Serializes a message object of type '<MAMstatus>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'engage) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'done) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'error) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'inProcess) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'complete) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MAMstatus>) istream)
  "Deserializes a message object of type '<MAMstatus>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'engage) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'done) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'error) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'inProcess) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'complete) (cl:not (cl:zerop (cl:read-byte istream))))
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MAMstatus>)))
  "Returns string type for a message object of type '<MAMstatus>"
  "machines/MAMstatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MAMstatus)))
  "Returns string type for a message object of type 'MAMstatus"
  "machines/MAMstatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MAMstatus>)))
  "Returns md5sum for a message object of type '<MAMstatus>"
  "14b63e6a6cf35762331b707484ff880e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MAMstatus)))
  "Returns md5sum for a message object of type 'MAMstatus"
  "14b63e6a6cf35762331b707484ff880e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MAMstatus>)))
  "Returns full string definition for message of type '<MAMstatus>"
  (cl:format cl:nil "Header header~%bool engage~%bool done~%bool error~%bool inProcess~%bool complete~%float64 position~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MAMstatus)))
  "Returns full string definition for message of type 'MAMstatus"
  (cl:format cl:nil "Header header~%bool engage~%bool done~%bool error~%bool inProcess~%bool complete~%float64 position~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MAMstatus>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     1
     1
     1
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MAMstatus>))
  "Converts a ROS message object to a list"
  (cl:list 'MAMstatus
    (cl:cons ':header (header msg))
    (cl:cons ':engage (engage msg))
    (cl:cons ':done (done msg))
    (cl:cons ':error (error msg))
    (cl:cons ':inProcess (inProcess msg))
    (cl:cons ':complete (complete msg))
    (cl:cons ':position (position msg))
))
