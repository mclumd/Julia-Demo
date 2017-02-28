; Auto-generated. Do not edit!


(cl:in-package alma_ros_pkg-msg)


;//! \htmlinclude AlmaDB.msg.html

(cl:defclass <AlmaDB> (roslisp-msg-protocol:ros-message)
  ((entries
    :reader entries
    :initarg :entries
    :type (cl:vector alma_ros_pkg-msg:AlmaFmla)
   :initform (cl:make-array 0 :element-type 'alma_ros_pkg-msg:AlmaFmla :initial-element (cl:make-instance 'alma_ros_pkg-msg:AlmaFmla))))
)

(cl:defclass AlmaDB (<AlmaDB>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AlmaDB>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AlmaDB)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name alma_ros_pkg-msg:<AlmaDB> is deprecated: use alma_ros_pkg-msg:AlmaDB instead.")))

(cl:ensure-generic-function 'entries-val :lambda-list '(m))
(cl:defmethod entries-val ((m <AlmaDB>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alma_ros_pkg-msg:entries-val is deprecated.  Use alma_ros_pkg-msg:entries instead.")
  (entries m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AlmaDB>) ostream)
  "Serializes a message object of type '<AlmaDB>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'entries))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'entries))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AlmaDB>) istream)
  "Deserializes a message object of type '<AlmaDB>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'entries) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'entries)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'alma_ros_pkg-msg:AlmaFmla))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AlmaDB>)))
  "Returns string type for a message object of type '<AlmaDB>"
  "alma_ros_pkg/AlmaDB")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AlmaDB)))
  "Returns string type for a message object of type 'AlmaDB"
  "alma_ros_pkg/AlmaDB")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AlmaDB>)))
  "Returns md5sum for a message object of type '<AlmaDB>"
  "23813a74eebe8f35e8b0ce471b08dff6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AlmaDB)))
  "Returns md5sum for a message object of type 'AlmaDB"
  "23813a74eebe8f35e8b0ce471b08dff6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AlmaDB>)))
  "Returns full string definition for message of type '<AlmaDB>"
  (cl:format cl:nil "AlmaFmla[] entries~%================================================================================~%MSG: alma_ros_pkg/AlmaFmla~%# Internal godel-style code for a formula, the formula itself, and whether or not it's currently trusted~%int32 code~%string fmla~%bool trusted~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AlmaDB)))
  "Returns full string definition for message of type 'AlmaDB"
  (cl:format cl:nil "AlmaFmla[] entries~%================================================================================~%MSG: alma_ros_pkg/AlmaFmla~%# Internal godel-style code for a formula, the formula itself, and whether or not it's currently trusted~%int32 code~%string fmla~%bool trusted~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AlmaDB>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'entries) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AlmaDB>))
  "Converts a ROS message object to a list"
  (cl:list 'AlmaDB
    (cl:cons ':entries (entries msg))
))
