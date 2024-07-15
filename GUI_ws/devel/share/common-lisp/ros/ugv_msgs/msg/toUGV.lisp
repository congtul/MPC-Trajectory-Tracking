; Auto-generated. Do not edit!


(cl:in-package ugv_msgs-msg)


;//! \htmlinclude toUGV.msg.html

(cl:defclass <toUGV> (roslisp-msg-protocol:ros-message)
  ((mode
    :reader mode
    :initarg :mode
    :type cl:fixnum
    :initform 0)
   (start_mode
    :reader start_mode
    :initarg :start_mode
    :type cl:fixnum
    :initform 0)
   (send_parameters
    :reader send_parameters
    :initarg :send_parameters
    :type cl:fixnum
    :initform 0)
   (Kp_steering
    :reader Kp_steering
    :initarg :Kp_steering
    :type cl:float
    :initform 0.0)
   (Ki_steering
    :reader Ki_steering
    :initarg :Ki_steering
    :type cl:float
    :initform 0.0)
   (Kd_steering
    :reader Kd_steering
    :initarg :Kd_steering
    :type cl:float
    :initform 0.0)
   (Kp_speed
    :reader Kp_speed
    :initarg :Kp_speed
    :type cl:float
    :initform 0.0)
   (Ki_speed
    :reader Ki_speed
    :initarg :Ki_speed
    :type cl:float
    :initform 0.0)
   (Kd_speed
    :reader Kd_speed
    :initarg :Kd_speed
    :type cl:float
    :initform 0.0)
   (set_speed
    :reader set_speed
    :initarg :set_speed
    :type cl:float
    :initform 0.0)
   (set_angle
    :reader set_angle
    :initarg :set_angle
    :type cl:float
    :initform 0.0)
   (mpc_L_wheel
    :reader mpc_L_wheel
    :initarg :mpc_L_wheel
    :type cl:float
    :initform 0.0)
   (mpc_Np
    :reader mpc_Np
    :initarg :mpc_Np
    :type cl:fixnum
    :initform 0)
   (mpc_Nc
    :reader mpc_Nc
    :initarg :mpc_Nc
    :type cl:fixnum
    :initform 0)
   (mpc_Q
    :reader mpc_Q
    :initarg :mpc_Q
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (mpc_Qp
    :reader mpc_Qp
    :initarg :mpc_Qp
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (mpc_R
    :reader mpc_R
    :initarg :mpc_R
    :type cl:float
    :initform 0.0)
   (mpc_umax
    :reader mpc_umax
    :initarg :mpc_umax
    :type cl:float
    :initform 0.0)
   (mpc_umin
    :reader mpc_umin
    :initarg :mpc_umin
    :type cl:float
    :initform 0.0)
   (refpoint_offset
    :reader refpoint_offset
    :initarg :refpoint_offset
    :type cl:fixnum
    :initform 0)
   (lqr_L_wheel
    :reader lqr_L_wheel
    :initarg :lqr_L_wheel
    :type cl:float
    :initform 0.0)
   (lqr_Np
    :reader lqr_Np
    :initarg :lqr_Np
    :type cl:fixnum
    :initform 0)
   (lqr_Q
    :reader lqr_Q
    :initarg :lqr_Q
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (lqr_K
    :reader lqr_K
    :initarg :lqr_K
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (lqr_R
    :reader lqr_R
    :initarg :lqr_R
    :type cl:float
    :initform 0.0)
   (lqr_umax
    :reader lqr_umax
    :initarg :lqr_umax
    :type cl:float
    :initform 0.0)
   (lqr_umin
    :reader lqr_umin
    :initarg :lqr_umin
    :type cl:float
    :initform 0.0)
   (TrajectoryType
    :reader TrajectoryType
    :initarg :TrajectoryType
    :type cl:fixnum
    :initform 0)
   (numWaypoint
    :reader numWaypoint
    :initarg :numWaypoint
    :type cl:fixnum
    :initform 0)
   (lat_base
    :reader lat_base
    :initarg :lat_base
    :type cl:float
    :initform 0.0)
   (lng_base
    :reader lng_base
    :initarg :lng_base
    :type cl:float
    :initform 0.0)
   (X_point
    :reader X_point
    :initarg :X_point
    :type (cl:vector cl:float)
   :initform (cl:make-array 40 :element-type 'cl:float :initial-element 0.0))
   (Y_point
    :reader Y_point
    :initarg :Y_point
    :type (cl:vector cl:float)
   :initform (cl:make-array 40 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass toUGV (<toUGV>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <toUGV>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'toUGV)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ugv_msgs-msg:<toUGV> is deprecated: use ugv_msgs-msg:toUGV instead.")))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:mode-val is deprecated.  Use ugv_msgs-msg:mode instead.")
  (mode m))

(cl:ensure-generic-function 'start_mode-val :lambda-list '(m))
(cl:defmethod start_mode-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:start_mode-val is deprecated.  Use ugv_msgs-msg:start_mode instead.")
  (start_mode m))

(cl:ensure-generic-function 'send_parameters-val :lambda-list '(m))
(cl:defmethod send_parameters-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:send_parameters-val is deprecated.  Use ugv_msgs-msg:send_parameters instead.")
  (send_parameters m))

(cl:ensure-generic-function 'Kp_steering-val :lambda-list '(m))
(cl:defmethod Kp_steering-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:Kp_steering-val is deprecated.  Use ugv_msgs-msg:Kp_steering instead.")
  (Kp_steering m))

(cl:ensure-generic-function 'Ki_steering-val :lambda-list '(m))
(cl:defmethod Ki_steering-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:Ki_steering-val is deprecated.  Use ugv_msgs-msg:Ki_steering instead.")
  (Ki_steering m))

(cl:ensure-generic-function 'Kd_steering-val :lambda-list '(m))
(cl:defmethod Kd_steering-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:Kd_steering-val is deprecated.  Use ugv_msgs-msg:Kd_steering instead.")
  (Kd_steering m))

(cl:ensure-generic-function 'Kp_speed-val :lambda-list '(m))
(cl:defmethod Kp_speed-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:Kp_speed-val is deprecated.  Use ugv_msgs-msg:Kp_speed instead.")
  (Kp_speed m))

(cl:ensure-generic-function 'Ki_speed-val :lambda-list '(m))
(cl:defmethod Ki_speed-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:Ki_speed-val is deprecated.  Use ugv_msgs-msg:Ki_speed instead.")
  (Ki_speed m))

(cl:ensure-generic-function 'Kd_speed-val :lambda-list '(m))
(cl:defmethod Kd_speed-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:Kd_speed-val is deprecated.  Use ugv_msgs-msg:Kd_speed instead.")
  (Kd_speed m))

(cl:ensure-generic-function 'set_speed-val :lambda-list '(m))
(cl:defmethod set_speed-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:set_speed-val is deprecated.  Use ugv_msgs-msg:set_speed instead.")
  (set_speed m))

(cl:ensure-generic-function 'set_angle-val :lambda-list '(m))
(cl:defmethod set_angle-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:set_angle-val is deprecated.  Use ugv_msgs-msg:set_angle instead.")
  (set_angle m))

(cl:ensure-generic-function 'mpc_L_wheel-val :lambda-list '(m))
(cl:defmethod mpc_L_wheel-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:mpc_L_wheel-val is deprecated.  Use ugv_msgs-msg:mpc_L_wheel instead.")
  (mpc_L_wheel m))

(cl:ensure-generic-function 'mpc_Np-val :lambda-list '(m))
(cl:defmethod mpc_Np-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:mpc_Np-val is deprecated.  Use ugv_msgs-msg:mpc_Np instead.")
  (mpc_Np m))

(cl:ensure-generic-function 'mpc_Nc-val :lambda-list '(m))
(cl:defmethod mpc_Nc-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:mpc_Nc-val is deprecated.  Use ugv_msgs-msg:mpc_Nc instead.")
  (mpc_Nc m))

(cl:ensure-generic-function 'mpc_Q-val :lambda-list '(m))
(cl:defmethod mpc_Q-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:mpc_Q-val is deprecated.  Use ugv_msgs-msg:mpc_Q instead.")
  (mpc_Q m))

(cl:ensure-generic-function 'mpc_Qp-val :lambda-list '(m))
(cl:defmethod mpc_Qp-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:mpc_Qp-val is deprecated.  Use ugv_msgs-msg:mpc_Qp instead.")
  (mpc_Qp m))

(cl:ensure-generic-function 'mpc_R-val :lambda-list '(m))
(cl:defmethod mpc_R-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:mpc_R-val is deprecated.  Use ugv_msgs-msg:mpc_R instead.")
  (mpc_R m))

(cl:ensure-generic-function 'mpc_umax-val :lambda-list '(m))
(cl:defmethod mpc_umax-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:mpc_umax-val is deprecated.  Use ugv_msgs-msg:mpc_umax instead.")
  (mpc_umax m))

(cl:ensure-generic-function 'mpc_umin-val :lambda-list '(m))
(cl:defmethod mpc_umin-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:mpc_umin-val is deprecated.  Use ugv_msgs-msg:mpc_umin instead.")
  (mpc_umin m))

(cl:ensure-generic-function 'refpoint_offset-val :lambda-list '(m))
(cl:defmethod refpoint_offset-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:refpoint_offset-val is deprecated.  Use ugv_msgs-msg:refpoint_offset instead.")
  (refpoint_offset m))

(cl:ensure-generic-function 'lqr_L_wheel-val :lambda-list '(m))
(cl:defmethod lqr_L_wheel-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:lqr_L_wheel-val is deprecated.  Use ugv_msgs-msg:lqr_L_wheel instead.")
  (lqr_L_wheel m))

(cl:ensure-generic-function 'lqr_Np-val :lambda-list '(m))
(cl:defmethod lqr_Np-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:lqr_Np-val is deprecated.  Use ugv_msgs-msg:lqr_Np instead.")
  (lqr_Np m))

(cl:ensure-generic-function 'lqr_Q-val :lambda-list '(m))
(cl:defmethod lqr_Q-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:lqr_Q-val is deprecated.  Use ugv_msgs-msg:lqr_Q instead.")
  (lqr_Q m))

(cl:ensure-generic-function 'lqr_K-val :lambda-list '(m))
(cl:defmethod lqr_K-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:lqr_K-val is deprecated.  Use ugv_msgs-msg:lqr_K instead.")
  (lqr_K m))

(cl:ensure-generic-function 'lqr_R-val :lambda-list '(m))
(cl:defmethod lqr_R-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:lqr_R-val is deprecated.  Use ugv_msgs-msg:lqr_R instead.")
  (lqr_R m))

(cl:ensure-generic-function 'lqr_umax-val :lambda-list '(m))
(cl:defmethod lqr_umax-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:lqr_umax-val is deprecated.  Use ugv_msgs-msg:lqr_umax instead.")
  (lqr_umax m))

(cl:ensure-generic-function 'lqr_umin-val :lambda-list '(m))
(cl:defmethod lqr_umin-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:lqr_umin-val is deprecated.  Use ugv_msgs-msg:lqr_umin instead.")
  (lqr_umin m))

(cl:ensure-generic-function 'TrajectoryType-val :lambda-list '(m))
(cl:defmethod TrajectoryType-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:TrajectoryType-val is deprecated.  Use ugv_msgs-msg:TrajectoryType instead.")
  (TrajectoryType m))

(cl:ensure-generic-function 'numWaypoint-val :lambda-list '(m))
(cl:defmethod numWaypoint-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:numWaypoint-val is deprecated.  Use ugv_msgs-msg:numWaypoint instead.")
  (numWaypoint m))

(cl:ensure-generic-function 'lat_base-val :lambda-list '(m))
(cl:defmethod lat_base-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:lat_base-val is deprecated.  Use ugv_msgs-msg:lat_base instead.")
  (lat_base m))

(cl:ensure-generic-function 'lng_base-val :lambda-list '(m))
(cl:defmethod lng_base-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:lng_base-val is deprecated.  Use ugv_msgs-msg:lng_base instead.")
  (lng_base m))

(cl:ensure-generic-function 'X_point-val :lambda-list '(m))
(cl:defmethod X_point-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:X_point-val is deprecated.  Use ugv_msgs-msg:X_point instead.")
  (X_point m))

(cl:ensure-generic-function 'Y_point-val :lambda-list '(m))
(cl:defmethod Y_point-val ((m <toUGV>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ugv_msgs-msg:Y_point-val is deprecated.  Use ugv_msgs-msg:Y_point instead.")
  (Y_point m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <toUGV>) ostream)
  "Serializes a message object of type '<toUGV>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'start_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'send_parameters)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Kp_steering))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Ki_steering))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Kd_steering))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Kp_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Ki_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Kd_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'set_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'set_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'mpc_L_wheel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'mpc_Np)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'mpc_Nc)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'mpc_Q))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'mpc_Qp))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'mpc_R))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'mpc_umax))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'mpc_umin))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'refpoint_offset)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'lqr_L_wheel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'lqr_Np)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'lqr_Q))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'lqr_K))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'lqr_R))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'lqr_umax))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'lqr_umin))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'TrajectoryType)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'numWaypoint)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'lat_base))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'lng_base))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'X_point))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'Y_point))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <toUGV>) istream)
  "Deserializes a message object of type '<toUGV>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'start_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'send_parameters)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Kp_steering) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Ki_steering) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Kd_steering) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Kp_speed) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Ki_speed) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Kd_speed) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'set_speed) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'set_angle) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mpc_L_wheel) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mpc_Np) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mpc_Nc) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  (cl:setf (cl:slot-value msg 'mpc_Q) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'mpc_Q)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'mpc_Qp) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'mpc_Qp)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mpc_R) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mpc_umax) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mpc_umin) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'refpoint_offset) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lqr_L_wheel) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'lqr_Np) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  (cl:setf (cl:slot-value msg 'lqr_Q) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'lqr_Q)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'lqr_K) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'lqr_K)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lqr_R) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lqr_umax) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lqr_umin) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'TrajectoryType) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'numWaypoint) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lat_base) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lng_base) (roslisp-utils:decode-double-float-bits bits)))
  (cl:setf (cl:slot-value msg 'X_point) (cl:make-array 40))
  (cl:let ((vals (cl:slot-value msg 'X_point)))
    (cl:dotimes (i 40)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'Y_point) (cl:make-array 40))
  (cl:let ((vals (cl:slot-value msg 'Y_point)))
    (cl:dotimes (i 40)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<toUGV>)))
  "Returns string type for a message object of type '<toUGV>"
  "ugv_msgs/toUGV")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'toUGV)))
  "Returns string type for a message object of type 'toUGV"
  "ugv_msgs/toUGV")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<toUGV>)))
  "Returns md5sum for a message object of type '<toUGV>"
  "1efb4b5a89c87d8d3553438208941e46")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'toUGV)))
  "Returns md5sum for a message object of type 'toUGV"
  "1efb4b5a89c87d8d3553438208941e46")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<toUGV>)))
  "Returns full string definition for message of type '<toUGV>"
  (cl:format cl:nil "#0: update PID, 1: manual, 2: MPC, 3: LQR~%uint8 mode~%uint8 start_mode~%uint8 send_parameters~%~%#Parameters for PID~%float64 Kp_steering~%float64 Ki_steering ~%float64 Kd_steering~%float64 Kp_speed~%float64 Ki_speed ~%float64 Kd_speed~%~%# Parameters for manual~%float64 set_speed~%float64 set_angle~%~%# Parameters for MPC~%float64 mpc_L_wheel~%int8 mpc_Np~%int8 mpc_Nc~%float64[3] mpc_Q~%float64[3] mpc_Qp~%float64 mpc_R~%float64 mpc_umax~%float64 mpc_umin~%int8 refpoint_offset~%~%#Parameters for LQR~%float64 lqr_L_wheel~%int8 lqr_Np~%float64[3] lqr_Q~%float64[3] lqr_K~%float64 lqr_R~%float64 lqr_umax~%float64 lqr_umin~%~%int8 TrajectoryType #Line = 0~%~%int8 numWaypoint   # number of waypoint except for base waypoint~%float64 lat_base~%float64 lng_base~%float64[40] X_point~%float64[40] Y_point~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'toUGV)))
  "Returns full string definition for message of type 'toUGV"
  (cl:format cl:nil "#0: update PID, 1: manual, 2: MPC, 3: LQR~%uint8 mode~%uint8 start_mode~%uint8 send_parameters~%~%#Parameters for PID~%float64 Kp_steering~%float64 Ki_steering ~%float64 Kd_steering~%float64 Kp_speed~%float64 Ki_speed ~%float64 Kd_speed~%~%# Parameters for manual~%float64 set_speed~%float64 set_angle~%~%# Parameters for MPC~%float64 mpc_L_wheel~%int8 mpc_Np~%int8 mpc_Nc~%float64[3] mpc_Q~%float64[3] mpc_Qp~%float64 mpc_R~%float64 mpc_umax~%float64 mpc_umin~%int8 refpoint_offset~%~%#Parameters for LQR~%float64 lqr_L_wheel~%int8 lqr_Np~%float64[3] lqr_Q~%float64[3] lqr_K~%float64 lqr_R~%float64 lqr_umax~%float64 lqr_umin~%~%int8 TrajectoryType #Line = 0~%~%int8 numWaypoint   # number of waypoint except for base waypoint~%float64 lat_base~%float64 lng_base~%float64[40] X_point~%float64[40] Y_point~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <toUGV>))
  (cl:+ 0
     1
     1
     1
     8
     8
     8
     8
     8
     8
     8
     8
     8
     1
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'mpc_Q) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'mpc_Qp) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     8
     8
     8
     1
     8
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'lqr_Q) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'lqr_K) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     8
     8
     8
     1
     1
     8
     8
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'X_point) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'Y_point) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <toUGV>))
  "Converts a ROS message object to a list"
  (cl:list 'toUGV
    (cl:cons ':mode (mode msg))
    (cl:cons ':start_mode (start_mode msg))
    (cl:cons ':send_parameters (send_parameters msg))
    (cl:cons ':Kp_steering (Kp_steering msg))
    (cl:cons ':Ki_steering (Ki_steering msg))
    (cl:cons ':Kd_steering (Kd_steering msg))
    (cl:cons ':Kp_speed (Kp_speed msg))
    (cl:cons ':Ki_speed (Ki_speed msg))
    (cl:cons ':Kd_speed (Kd_speed msg))
    (cl:cons ':set_speed (set_speed msg))
    (cl:cons ':set_angle (set_angle msg))
    (cl:cons ':mpc_L_wheel (mpc_L_wheel msg))
    (cl:cons ':mpc_Np (mpc_Np msg))
    (cl:cons ':mpc_Nc (mpc_Nc msg))
    (cl:cons ':mpc_Q (mpc_Q msg))
    (cl:cons ':mpc_Qp (mpc_Qp msg))
    (cl:cons ':mpc_R (mpc_R msg))
    (cl:cons ':mpc_umax (mpc_umax msg))
    (cl:cons ':mpc_umin (mpc_umin msg))
    (cl:cons ':refpoint_offset (refpoint_offset msg))
    (cl:cons ':lqr_L_wheel (lqr_L_wheel msg))
    (cl:cons ':lqr_Np (lqr_Np msg))
    (cl:cons ':lqr_Q (lqr_Q msg))
    (cl:cons ':lqr_K (lqr_K msg))
    (cl:cons ':lqr_R (lqr_R msg))
    (cl:cons ':lqr_umax (lqr_umax msg))
    (cl:cons ':lqr_umin (lqr_umin msg))
    (cl:cons ':TrajectoryType (TrajectoryType msg))
    (cl:cons ':numWaypoint (numWaypoint msg))
    (cl:cons ':lat_base (lat_base msg))
    (cl:cons ':lng_base (lng_base msg))
    (cl:cons ':X_point (X_point msg))
    (cl:cons ':Y_point (Y_point msg))
))
