; Auto-generated. Do not edit!


(cl:in-package ugv_msgs-msg)


;//! \htmlinclude toGUI.msg.html

(cl:defclass <toGUI> (roslisp-msg-protocol:ros-message)
  ((lat_postion
    :reader lat_postion
    :initarg :lat_postion
    :type cl:float
    :initform 0.0)
   (lng_postion
    :reader lng_postion
    :initarg :lng_postion
    :type cl:float
    :initform 0.0)
   (x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (set_speed
    :reader set_speed
    :initarg :set_speed
    :type cl:float
    :initform 0.0)
   (speed_left
    :reader speed_left
    :initarg :speed_left
    :type cl:float
    :initform 0.0)
   (speed_right
    :reader speed_right
    :initarg :speed_right
    :type cl:float
    :initform 0.0)
   (yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0)
   (set_steering
    :reader set_steering
    :initarg :set_steering
    :type cl:float
    :initform 0.0)
   (steering
    :reader steering
    :initarg :steering
    :type cl:float
    :initform 0.0)
   (num_mpc_refpath
    :reader num_mpc_refpath
    :initarg :num_mpc_refpath
    :type cl:fixnum
    :initform 0)
   (x_mpc_repath
    :reader x_mpc_repath
    :initarg :x_mpc_repath
    :type (cl:vector cl:float)
   :initform (cl:make-array 20 :element-type 'cl:float :initial-element 0.0))
   (y_mpc_repath
    :reader y_mpc_repath
    :initarg :y_mpc_repath
    :type (cl:vector cl:float)
   :initform (cl:make-array 20 :element-type 'cl:float :initial-element 0.0))
   (yaw_mpc_repath
    :reader yaw_mpc_repath
    :initarg :yaw_mpc_repath
    :type (cl:vector cl:float)
   :initform (cl:make-array 20 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass toGUI (<toGUI>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <toGUI>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'toGUI)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ugv_msgs-msg:<toGUI> is deprecated: use ugv_msgs-msg:toGUI instead.")))

(cl:ensure-generic-function 'lat_postion-val :lambda-list '(m))
(cl:defmethod lat_postion-val ((m <toGUI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:lat_postion-val is deprecated.  Use ugv_msgs-msg:lat_postion instead.")
  (lat_postion m))

(cl:ensure-generic-function 'lng_postion-val :lambda-list '(m))
(cl:defmethod lng_postion-val ((m <toGUI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:lng_postion-val is deprecated.  Use ugv_msgs-msg:lng_postion instead.")
  (lng_postion m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <toGUI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:x-val is deprecated.  Use ugv_msgs-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <toGUI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:y-val is deprecated.  Use ugv_msgs-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'set_speed-val :lambda-list '(m))
(cl:defmethod set_speed-val ((m <toGUI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:set_speed-val is deprecated.  Use ugv_msgs-msg:set_speed instead.")
  (set_speed m))

(cl:ensure-generic-function 'speed_left-val :lambda-list '(m))
(cl:defmethod speed_left-val ((m <toGUI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:speed_left-val is deprecated.  Use ugv_msgs-msg:speed_left instead.")
  (speed_left m))

(cl:ensure-generic-function 'speed_right-val :lambda-list '(m))
(cl:defmethod speed_right-val ((m <toGUI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:speed_right-val is deprecated.  Use ugv_msgs-msg:speed_right instead.")
  (speed_right m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <toGUI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:yaw-val is deprecated.  Use ugv_msgs-msg:yaw instead.")
  (yaw m))

(cl:ensure-generic-function 'set_steering-val :lambda-list '(m))
(cl:defmethod set_steering-val ((m <toGUI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:set_steering-val is deprecated.  Use ugv_msgs-msg:set_steering instead.")
  (set_steering m))

(cl:ensure-generic-function 'steering-val :lambda-list '(m))
(cl:defmethod steering-val ((m <toGUI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:steering-val is deprecated.  Use ugv_msgs-msg:steering instead.")
  (steering m))

(cl:ensure-generic-function 'num_mpc_refpath-val :lambda-list '(m))
(cl:defmethod num_mpc_refpath-val ((m <toGUI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:num_mpc_refpath-val is deprecated.  Use ugv_msgs-msg:num_mpc_refpath instead.")
  (num_mpc_refpath m))

(cl:ensure-generic-function 'x_mpc_repath-val :lambda-list '(m))
(cl:defmethod x_mpc_repath-val ((m <toGUI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:x_mpc_repath-val is deprecated.  Use ugv_msgs-msg:x_mpc_repath instead.")
  (x_mpc_repath m))

(cl:ensure-generic-function 'y_mpc_repath-val :lambda-list '(m))
(cl:defmethod y_mpc_repath-val ((m <toGUI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:y_mpc_repath-val is deprecated.  Use ugv_msgs-msg:y_mpc_repath instead.")
  (y_mpc_repath m))

(cl:ensure-generic-function 'yaw_mpc_repath-val :lambda-list '(m))
(cl:defmethod yaw_mpc_repath-val ((m <toGUI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:yaw_mpc_repath-val is deprecated.  Use ugv_msgs-msg:yaw_mpc_repath instead.")
  (yaw_mpc_repath m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <toGUI>) ostream)
  "Serializes a message object of type '<toGUI>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'lat_postion))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'lng_postion))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'set_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speed_left))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speed_right))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'set_steering))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'steering))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'num_mpc_refpath)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'x_mpc_repath))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'y_mpc_repath))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'yaw_mpc_repath))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <toGUI>) istream)
  "Deserializes a message object of type '<toGUI>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lat_postion) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lng_postion) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'set_speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed_left) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed_right) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'set_steering) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'steering) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num_mpc_refpath) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  (cl:setf (cl:slot-value msg 'x_mpc_repath) (cl:make-array 20))
  (cl:let ((vals (cl:slot-value msg 'x_mpc_repath)))
    (cl:dotimes (i 20)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'y_mpc_repath) (cl:make-array 20))
  (cl:let ((vals (cl:slot-value msg 'y_mpc_repath)))
    (cl:dotimes (i 20)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'yaw_mpc_repath) (cl:make-array 20))
  (cl:let ((vals (cl:slot-value msg 'yaw_mpc_repath)))
    (cl:dotimes (i 20)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<toGUI>)))
  "Returns string type for a message object of type '<toGUI>"
  "ugv_msgs/toGUI")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'toGUI)))
  "Returns string type for a message object of type 'toGUI"
  "ugv_msgs/toGUI")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<toGUI>)))
  "Returns md5sum for a message object of type '<toGUI>"
  "4a28929b5edb2cd02f7ac9cd5152eccc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'toGUI)))
  "Returns md5sum for a message object of type 'toGUI"
  "4a28929b5edb2cd02f7ac9cd5152eccc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<toGUI>)))
  "Returns full string definition for message of type '<toGUI>"
  (cl:format cl:nil "#GPS Data ~%float64 lat_postion~%float64 lng_postion~%float32 x~%float32 y~%float32 set_speed~%float32 speed_left~%float32 speed_right~%~%#IMU Data ~%#float32 roll~%#float32 pitch~%float32 yaw~%~%#Controll Data~%float32 set_steering~%float32 steering~%int8 num_mpc_refpath~%float32[20] x_mpc_repath~%float32[20] y_mpc_repath~%float32[20] yaw_mpc_repath~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'toGUI)))
  "Returns full string definition for message of type 'toGUI"
  (cl:format cl:nil "#GPS Data ~%float64 lat_postion~%float64 lng_postion~%float32 x~%float32 y~%float32 set_speed~%float32 speed_left~%float32 speed_right~%~%#IMU Data ~%#float32 roll~%#float32 pitch~%float32 yaw~%~%#Controll Data~%float32 set_steering~%float32 steering~%int8 num_mpc_refpath~%float32[20] x_mpc_repath~%float32[20] y_mpc_repath~%float32[20] yaw_mpc_repath~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <toGUI>))
  (cl:+ 0
     8
     8
     4
     4
     4
     4
     4
     4
     4
     4
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'x_mpc_repath) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'y_mpc_repath) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'yaw_mpc_repath) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <toGUI>))
  "Converts a ROS message object to a list"
  (cl:list 'toGUI
    (cl:cons ':lat_postion (lat_postion msg))
    (cl:cons ':lng_postion (lng_postion msg))
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':set_speed (set_speed msg))
    (cl:cons ':speed_left (speed_left msg))
    (cl:cons ':speed_right (speed_right msg))
    (cl:cons ':yaw (yaw msg))
    (cl:cons ':set_steering (set_steering msg))
    (cl:cons ':steering (steering msg))
    (cl:cons ':num_mpc_refpath (num_mpc_refpath msg))
    (cl:cons ':x_mpc_repath (x_mpc_repath msg))
    (cl:cons ':y_mpc_repath (y_mpc_repath msg))
    (cl:cons ':yaw_mpc_repath (yaw_mpc_repath msg))
))
