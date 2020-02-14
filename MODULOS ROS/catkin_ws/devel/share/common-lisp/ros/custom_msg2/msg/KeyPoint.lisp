; Auto-generated. Do not edit!


(cl:in-package custom_msg2-msg)


;//! \htmlinclude KeyPoint.msg.html

(cl:defclass <KeyPoint> (roslisp-msg-protocol:ros-message)
  ((pt
    :reader pt
    :initarg :pt
    :type custom_msg2-msg:Point2f
    :initform (cl:make-instance 'custom_msg2-msg:Point2f))
   (size
    :reader size
    :initarg :size
    :type cl:float
    :initform 0.0)
   (angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0)
   (response
    :reader response
    :initarg :response
    :type cl:float
    :initform 0.0)
   (octave
    :reader octave
    :initarg :octave
    :type cl:integer
    :initform 0)
   (class_id
    :reader class_id
    :initarg :class_id
    :type cl:integer
    :initform 0)
   (idKeypoint
    :reader idKeypoint
    :initarg :idKeypoint
    :type cl:integer
    :initform 0))
)

(cl:defclass KeyPoint (<KeyPoint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <KeyPoint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'KeyPoint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name custom_msg2-msg:<KeyPoint> is deprecated: use custom_msg2-msg:KeyPoint instead.")))

(cl:ensure-generic-function 'pt-val :lambda-list '(m))
(cl:defmethod pt-val ((m <KeyPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg2-msg:pt-val is deprecated.  Use custom_msg2-msg:pt instead.")
  (pt m))

(cl:ensure-generic-function 'size-val :lambda-list '(m))
(cl:defmethod size-val ((m <KeyPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg2-msg:size-val is deprecated.  Use custom_msg2-msg:size instead.")
  (size m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <KeyPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg2-msg:angle-val is deprecated.  Use custom_msg2-msg:angle instead.")
  (angle m))

(cl:ensure-generic-function 'response-val :lambda-list '(m))
(cl:defmethod response-val ((m <KeyPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg2-msg:response-val is deprecated.  Use custom_msg2-msg:response instead.")
  (response m))

(cl:ensure-generic-function 'octave-val :lambda-list '(m))
(cl:defmethod octave-val ((m <KeyPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg2-msg:octave-val is deprecated.  Use custom_msg2-msg:octave instead.")
  (octave m))

(cl:ensure-generic-function 'class_id-val :lambda-list '(m))
(cl:defmethod class_id-val ((m <KeyPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg2-msg:class_id-val is deprecated.  Use custom_msg2-msg:class_id instead.")
  (class_id m))

(cl:ensure-generic-function 'idKeypoint-val :lambda-list '(m))
(cl:defmethod idKeypoint-val ((m <KeyPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg2-msg:idKeypoint-val is deprecated.  Use custom_msg2-msg:idKeypoint instead.")
  (idKeypoint m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <KeyPoint>) ostream)
  "Serializes a message object of type '<KeyPoint>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pt) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'size))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'response))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'octave)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'class_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'idKeypoint)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <KeyPoint>) istream)
  "Deserializes a message object of type '<KeyPoint>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pt) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'size) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'response) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'octave) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'class_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'idKeypoint) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<KeyPoint>)))
  "Returns string type for a message object of type '<KeyPoint>"
  "custom_msg2/KeyPoint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'KeyPoint)))
  "Returns string type for a message object of type 'KeyPoint"
  "custom_msg2/KeyPoint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<KeyPoint>)))
  "Returns md5sum for a message object of type '<KeyPoint>"
  "64408df8b1cfd0d048a1615611dc5467")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'KeyPoint)))
  "Returns md5sum for a message object of type 'KeyPoint"
  "64408df8b1cfd0d048a1615611dc5467")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<KeyPoint>)))
  "Returns full string definition for message of type '<KeyPoint>"
  (cl:format cl:nil "custom_msg2/Point2f pt~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%int32 idKeypoint~%~%~%================================================================================~%MSG: custom_msg2/Point2f~%float32 x~%float32 y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'KeyPoint)))
  "Returns full string definition for message of type 'KeyPoint"
  (cl:format cl:nil "custom_msg2/Point2f pt~%float32 size~%float32 angle~%float32 response~%int32 octave~%int32 class_id~%int32 idKeypoint~%~%~%================================================================================~%MSG: custom_msg2/Point2f~%float32 x~%float32 y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <KeyPoint>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pt))
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <KeyPoint>))
  "Converts a ROS message object to a list"
  (cl:list 'KeyPoint
    (cl:cons ':pt (pt msg))
    (cl:cons ':size (size msg))
    (cl:cons ':angle (angle msg))
    (cl:cons ':response (response msg))
    (cl:cons ':octave (octave msg))
    (cl:cons ':class_id (class_id msg))
    (cl:cons ':idKeypoint (idKeypoint msg))
))
