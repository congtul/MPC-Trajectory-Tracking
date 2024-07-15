; Auto-generated. Do not edit!


(cl:in-package ugv_msgs-msg)


;//! \htmlinclude IMU_calib.msg.html

(cl:defclass <IMU_calib> (roslisp-msg-protocol:ros-message)
  ((parameters
    :reader parameters
    :initarg :parameters
    :type cl:float
    :initform 0.0)
   (mode
    :reader mode
    :initarg :mode
    :type cl:fixnum
    :initform 0))
)

(cl:defclass IMU_calib (<IMU_calib>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IMU_calib>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IMU_calib)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ugv_msgs-msg:<IMU_calib> is deprecated: use ugv_msgs-msg:IMU_calib instead.")))

(cl:ensure-generic-function 'parameters-val :lambda-list '(m))
(cl:defmethod parameters-val ((m <IMU_calib>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:parameters-val is deprecated.  Use ugv_msgs-msg:parameters instead.")
  (parameters m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <IMU_calib>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:mode-val is deprecated.  Use ugv_msgs-msg:mode instead.")
  (mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IMU_calib>) ostream)
  "Serializes a message object of type '<IMU_calib>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'parameters))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IMU_calib>) istream)
  "Deserializes a message object of type '<IMU_calib>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'parameters) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IMU_calib>)))
  "Returns string type for a message object of type '<IMU_calib>"
  "ugv_msgs/IMU_calib")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IMU_calib)))
  "Returns string type for a message object of type 'IMU_calib"
  "ugv_msgs/IMU_calib")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IMU_calib>)))
  "Returns md5sum for a message object of type '<IMU_calib>"
  "8a20590408efba6d64d7d538c77eb428")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IMU_calib)))
  "Returns md5sum for a message object of type 'IMU_calib"
  "8a20590408efba6d64d7d538c77eb428")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IMU_calib>)))
  "Returns full string definition for message of type '<IMU_calib>"
  (cl:format cl:nil "float64 parameters~%int8 mode~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IMU_calib)))
  "Returns full string definition for message of type 'IMU_calib"
  (cl:format cl:nil "float64 parameters~%int8 mode~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IMU_calib>))
  (cl:+ 0
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IMU_calib>))
  "Converts a ROS message object to a list"
  (cl:list 'IMU_calib
    (cl:cons ':parameters (parameters msg))
    (cl:cons ':mode (mode msg))
))
