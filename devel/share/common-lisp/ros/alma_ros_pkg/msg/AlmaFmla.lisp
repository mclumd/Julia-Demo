; Auto-generated. Do not edit!


(cl:in-package alma_ros_pkg-msg)


;//! \htmlinclude AlmaFmla.msg.html

(cl:defclass <AlmaFmla> (roslisp-msg-protocol:ros-message)
  ((code
    :reader code
    :initarg :code
    :type cl:integer
    :initform 0)
   (fmla
    :reader fmla
    :initarg :fmla
    :type cl:string
    :initform "")
   (trusted
    :reader trusted
    :initarg :trusted
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass AlmaFmla (<AlmaFmla>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AlmaFmla>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AlmaFmla)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name alma_ros_pkg-msg:<AlmaFmla> is deprecated: use alma_ros_pkg-msg:AlmaFmla instead.")))

(cl:ensure-generic-function 'code-val :lambda-list '(m))
(cl:defmethod code-val ((m <AlmaFmla>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alma_ros_pkg-msg:code-val is deprecated.  Use alma_ros_pkg-msg:code instead.")
  (code m))

(cl:ensure-generic-function 'fmla-val :lambda-list '(m))
(cl:defmethod fmla-val ((m <AlmaFmla>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alma_ros_pkg-msg:fmla-val is deprecated.  Use alma_ros_pkg-msg:fmla instead.")
  (fmla m))

(cl:ensure-generic-function 'trusted-val :lambda-list '(m))
(cl:defmethod trusted-val ((m <AlmaFmla>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alma_ros_pkg-msg:trusted-val is deprecated.  Use alma_ros_pkg-msg:trusted instead.")
  (trusted m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AlmaFmla>) ostream)
  "Serializes a message object of type '<AlmaFmla>"
  (cl:let* ((signed (cl:slot-value msg 'code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'fmla))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'fmla))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'trusted) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AlmaFmla>) istream)
  "Deserializes a message object of type '<AlmaFmla>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fmla) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'fmla) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'trusted) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AlmaFmla>)))
  "Returns string type for a message object of type '<AlmaFmla>"
  "alma_ros_pkg/AlmaFmla")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AlmaFmla)))
  "Returns string type for a message object of type 'AlmaFmla"
  "alma_ros_pkg/AlmaFmla")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AlmaFmla>)))
  "Returns md5sum for a message object of type '<AlmaFmla>"
  "c9b259e2ef7db10347d3836a0db17661")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AlmaFmla)))
  "Returns md5sum for a message object of type 'AlmaFmla"
  "c9b259e2ef7db10347d3836a0db17661")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AlmaFmla>)))
  "Returns full string definition for message of type '<AlmaFmla>"
  (cl:format cl:nil "# Internal godel-style code for a formula, the formula itself, and whether or not it's currently trusted~%int32 code~%string fmla~%bool trusted~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AlmaFmla)))
  "Returns full string definition for message of type 'AlmaFmla"
  (cl:format cl:nil "# Internal godel-style code for a formula, the formula itself, and whether or not it's currently trusted~%int32 code~%string fmla~%bool trusted~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AlmaFmla>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'fmla))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AlmaFmla>))
  "Converts a ROS message object to a list"
  (cl:list 'AlmaFmla
    (cl:cons ':code (code msg))
    (cl:cons ':fmla (fmla msg))
    (cl:cons ':trusted (trusted msg))
))
