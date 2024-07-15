;; Auto-generated. Do not edit!


(when (boundp 'ugv_msgs::toUGV)
  (if (not (find-package "UGV_MSGS"))
    (make-package "UGV_MSGS"))
  (shadow 'toUGV (find-package "UGV_MSGS")))
(unless (find-package "UGV_MSGS::TOUGV")
  (make-package "UGV_MSGS::TOUGV"))

(in-package "ROS")
;;//! \htmlinclude toUGV.msg.html


(defclass ugv_msgs::toUGV
  :super ros::object
  :slots (_mode _start_mode _send_parameters _Kp_steering _Ki_steering _Kd_steering _Kp_speed _Ki_speed _Kd_speed _set_speed _set_angle _mpc_L_wheel _mpc_Np _mpc_Nc _mpc_Q _mpc_Qp _mpc_R _mpc_umax _mpc_umin _refpoint_offset _lqr_L_wheel _lqr_Np _lqr_Q _lqr_K _lqr_R _lqr_umax _lqr_umin _TrajectoryType _numWaypoint _lat_base _lng_base _X_point _Y_point ))

(defmethod ugv_msgs::toUGV
  (:init
   (&key
    ((:mode __mode) 0)
    ((:start_mode __start_mode) 0)
    ((:send_parameters __send_parameters) 0)
    ((:Kp_steering __Kp_steering) 0.0)
    ((:Ki_steering __Ki_steering) 0.0)
    ((:Kd_steering __Kd_steering) 0.0)
    ((:Kp_speed __Kp_speed) 0.0)
    ((:Ki_speed __Ki_speed) 0.0)
    ((:Kd_speed __Kd_speed) 0.0)
    ((:set_speed __set_speed) 0.0)
    ((:set_angle __set_angle) 0.0)
    ((:mpc_L_wheel __mpc_L_wheel) 0.0)
    ((:mpc_Np __mpc_Np) 0)
    ((:mpc_Nc __mpc_Nc) 0)
    ((:mpc_Q __mpc_Q) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:mpc_Qp __mpc_Qp) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:mpc_R __mpc_R) 0.0)
    ((:mpc_umax __mpc_umax) 0.0)
    ((:mpc_umin __mpc_umin) 0.0)
    ((:refpoint_offset __refpoint_offset) 0)
    ((:lqr_L_wheel __lqr_L_wheel) 0.0)
    ((:lqr_Np __lqr_Np) 0)
    ((:lqr_Q __lqr_Q) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:lqr_K __lqr_K) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:lqr_R __lqr_R) 0.0)
    ((:lqr_umax __lqr_umax) 0.0)
    ((:lqr_umin __lqr_umin) 0.0)
    ((:TrajectoryType __TrajectoryType) 0)
    ((:numWaypoint __numWaypoint) 0)
    ((:lat_base __lat_base) 0.0)
    ((:lng_base __lng_base) 0.0)
    ((:X_point __X_point) (make-array 40 :initial-element 0.0 :element-type :float))
    ((:Y_point __Y_point) (make-array 40 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _mode (round __mode))
   (setq _start_mode (round __start_mode))
   (setq _send_parameters (round __send_parameters))
   (setq _Kp_steering (float __Kp_steering))
   (setq _Ki_steering (float __Ki_steering))
   (setq _Kd_steering (float __Kd_steering))
   (setq _Kp_speed (float __Kp_speed))
   (setq _Ki_speed (float __Ki_speed))
   (setq _Kd_speed (float __Kd_speed))
   (setq _set_speed (float __set_speed))
   (setq _set_angle (float __set_angle))
   (setq _mpc_L_wheel (float __mpc_L_wheel))
   (setq _mpc_Np (round __mpc_Np))
   (setq _mpc_Nc (round __mpc_Nc))
   (setq _mpc_Q __mpc_Q)
   (setq _mpc_Qp __mpc_Qp)
   (setq _mpc_R (float __mpc_R))
   (setq _mpc_umax (float __mpc_umax))
   (setq _mpc_umin (float __mpc_umin))
   (setq _refpoint_offset (round __refpoint_offset))
   (setq _lqr_L_wheel (float __lqr_L_wheel))
   (setq _lqr_Np (round __lqr_Np))
   (setq _lqr_Q __lqr_Q)
   (setq _lqr_K __lqr_K)
   (setq _lqr_R (float __lqr_R))
   (setq _lqr_umax (float __lqr_umax))
   (setq _lqr_umin (float __lqr_umin))
   (setq _TrajectoryType (round __TrajectoryType))
   (setq _numWaypoint (round __numWaypoint))
   (setq _lat_base (float __lat_base))
   (setq _lng_base (float __lng_base))
   (setq _X_point __X_point)
   (setq _Y_point __Y_point)
   self)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:start_mode
   (&optional __start_mode)
   (if __start_mode (setq _start_mode __start_mode)) _start_mode)
  (:send_parameters
   (&optional __send_parameters)
   (if __send_parameters (setq _send_parameters __send_parameters)) _send_parameters)
  (:Kp_steering
   (&optional __Kp_steering)
   (if __Kp_steering (setq _Kp_steering __Kp_steering)) _Kp_steering)
  (:Ki_steering
   (&optional __Ki_steering)
   (if __Ki_steering (setq _Ki_steering __Ki_steering)) _Ki_steering)
  (:Kd_steering
   (&optional __Kd_steering)
   (if __Kd_steering (setq _Kd_steering __Kd_steering)) _Kd_steering)
  (:Kp_speed
   (&optional __Kp_speed)
   (if __Kp_speed (setq _Kp_speed __Kp_speed)) _Kp_speed)
  (:Ki_speed
   (&optional __Ki_speed)
   (if __Ki_speed (setq _Ki_speed __Ki_speed)) _Ki_speed)
  (:Kd_speed
   (&optional __Kd_speed)
   (if __Kd_speed (setq _Kd_speed __Kd_speed)) _Kd_speed)
  (:set_speed
   (&optional __set_speed)
   (if __set_speed (setq _set_speed __set_speed)) _set_speed)
  (:set_angle
   (&optional __set_angle)
   (if __set_angle (setq _set_angle __set_angle)) _set_angle)
  (:mpc_L_wheel
   (&optional __mpc_L_wheel)
   (if __mpc_L_wheel (setq _mpc_L_wheel __mpc_L_wheel)) _mpc_L_wheel)
  (:mpc_Np
   (&optional __mpc_Np)
   (if __mpc_Np (setq _mpc_Np __mpc_Np)) _mpc_Np)
  (:mpc_Nc
   (&optional __mpc_Nc)
   (if __mpc_Nc (setq _mpc_Nc __mpc_Nc)) _mpc_Nc)
  (:mpc_Q
   (&optional __mpc_Q)
   (if __mpc_Q (setq _mpc_Q __mpc_Q)) _mpc_Q)
  (:mpc_Qp
   (&optional __mpc_Qp)
   (if __mpc_Qp (setq _mpc_Qp __mpc_Qp)) _mpc_Qp)
  (:mpc_R
   (&optional __mpc_R)
   (if __mpc_R (setq _mpc_R __mpc_R)) _mpc_R)
  (:mpc_umax
   (&optional __mpc_umax)
   (if __mpc_umax (setq _mpc_umax __mpc_umax)) _mpc_umax)
  (:mpc_umin
   (&optional __mpc_umin)
   (if __mpc_umin (setq _mpc_umin __mpc_umin)) _mpc_umin)
  (:refpoint_offset
   (&optional __refpoint_offset)
   (if __refpoint_offset (setq _refpoint_offset __refpoint_offset)) _refpoint_offset)
  (:lqr_L_wheel
   (&optional __lqr_L_wheel)
   (if __lqr_L_wheel (setq _lqr_L_wheel __lqr_L_wheel)) _lqr_L_wheel)
  (:lqr_Np
   (&optional __lqr_Np)
   (if __lqr_Np (setq _lqr_Np __lqr_Np)) _lqr_Np)
  (:lqr_Q
   (&optional __lqr_Q)
   (if __lqr_Q (setq _lqr_Q __lqr_Q)) _lqr_Q)
  (:lqr_K
   (&optional __lqr_K)
   (if __lqr_K (setq _lqr_K __lqr_K)) _lqr_K)
  (:lqr_R
   (&optional __lqr_R)
   (if __lqr_R (setq _lqr_R __lqr_R)) _lqr_R)
  (:lqr_umax
   (&optional __lqr_umax)
   (if __lqr_umax (setq _lqr_umax __lqr_umax)) _lqr_umax)
  (:lqr_umin
   (&optional __lqr_umin)
   (if __lqr_umin (setq _lqr_umin __lqr_umin)) _lqr_umin)
  (:TrajectoryType
   (&optional __TrajectoryType)
   (if __TrajectoryType (setq _TrajectoryType __TrajectoryType)) _TrajectoryType)
  (:numWaypoint
   (&optional __numWaypoint)
   (if __numWaypoint (setq _numWaypoint __numWaypoint)) _numWaypoint)
  (:lat_base
   (&optional __lat_base)
   (if __lat_base (setq _lat_base __lat_base)) _lat_base)
  (:lng_base
   (&optional __lng_base)
   (if __lng_base (setq _lng_base __lng_base)) _lng_base)
  (:X_point
   (&optional __X_point)
   (if __X_point (setq _X_point __X_point)) _X_point)
  (:Y_point
   (&optional __Y_point)
   (if __Y_point (setq _Y_point __Y_point)) _Y_point)
  (:serialization-length
   ()
   (+
    ;; uint8 _mode
    1
    ;; uint8 _start_mode
    1
    ;; uint8 _send_parameters
    1
    ;; float64 _Kp_steering
    8
    ;; float64 _Ki_steering
    8
    ;; float64 _Kd_steering
    8
    ;; float64 _Kp_speed
    8
    ;; float64 _Ki_speed
    8
    ;; float64 _Kd_speed
    8
    ;; float64 _set_speed
    8
    ;; float64 _set_angle
    8
    ;; float64 _mpc_L_wheel
    8
    ;; int8 _mpc_Np
    1
    ;; int8 _mpc_Nc
    1
    ;; float64[3] _mpc_Q
    (* 8    3)
    ;; float64[3] _mpc_Qp
    (* 8    3)
    ;; float64 _mpc_R
    8
    ;; float64 _mpc_umax
    8
    ;; float64 _mpc_umin
    8
    ;; int8 _refpoint_offset
    1
    ;; float64 _lqr_L_wheel
    8
    ;; int8 _lqr_Np
    1
    ;; float64[3] _lqr_Q
    (* 8    3)
    ;; float64[3] _lqr_K
    (* 8    3)
    ;; float64 _lqr_R
    8
    ;; float64 _lqr_umax
    8
    ;; float64 _lqr_umin
    8
    ;; int8 _TrajectoryType
    1
    ;; int8 _numWaypoint
    1
    ;; float64 _lat_base
    8
    ;; float64 _lng_base
    8
    ;; float64[40] _X_point
    (* 8    40)
    ;; float64[40] _Y_point
    (* 8    40)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _mode
       (write-byte _mode s)
     ;; uint8 _start_mode
       (write-byte _start_mode s)
     ;; uint8 _send_parameters
       (write-byte _send_parameters s)
     ;; float64 _Kp_steering
       (sys::poke _Kp_steering (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Ki_steering
       (sys::poke _Ki_steering (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Kd_steering
       (sys::poke _Kd_steering (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Kp_speed
       (sys::poke _Kp_speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Ki_speed
       (sys::poke _Ki_speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Kd_speed
       (sys::poke _Kd_speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _set_speed
       (sys::poke _set_speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _set_angle
       (sys::poke _set_angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _mpc_L_wheel
       (sys::poke _mpc_L_wheel (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int8 _mpc_Np
       (write-byte _mpc_Np s)
     ;; int8 _mpc_Nc
       (write-byte _mpc_Nc s)
     ;; float64[3] _mpc_Q
     (dotimes (i 3)
       (sys::poke (elt _mpc_Q i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[3] _mpc_Qp
     (dotimes (i 3)
       (sys::poke (elt _mpc_Qp i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _mpc_R
       (sys::poke _mpc_R (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _mpc_umax
       (sys::poke _mpc_umax (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _mpc_umin
       (sys::poke _mpc_umin (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int8 _refpoint_offset
       (write-byte _refpoint_offset s)
     ;; float64 _lqr_L_wheel
       (sys::poke _lqr_L_wheel (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int8 _lqr_Np
       (write-byte _lqr_Np s)
     ;; float64[3] _lqr_Q
     (dotimes (i 3)
       (sys::poke (elt _lqr_Q i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[3] _lqr_K
     (dotimes (i 3)
       (sys::poke (elt _lqr_K i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _lqr_R
       (sys::poke _lqr_R (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _lqr_umax
       (sys::poke _lqr_umax (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _lqr_umin
       (sys::poke _lqr_umin (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int8 _TrajectoryType
       (write-byte _TrajectoryType s)
     ;; int8 _numWaypoint
       (write-byte _numWaypoint s)
     ;; float64 _lat_base
       (sys::poke _lat_base (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _lng_base
       (sys::poke _lng_base (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64[40] _X_point
     (dotimes (i 40)
       (sys::poke (elt _X_point i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[40] _Y_point
     (dotimes (i 40)
       (sys::poke (elt _Y_point i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _mode
     (setq _mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _start_mode
     (setq _start_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _send_parameters
     (setq _send_parameters (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64 _Kp_steering
     (setq _Kp_steering (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Ki_steering
     (setq _Ki_steering (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Kd_steering
     (setq _Kd_steering (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Kp_speed
     (setq _Kp_speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Ki_speed
     (setq _Ki_speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Kd_speed
     (setq _Kd_speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _set_speed
     (setq _set_speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _set_angle
     (setq _set_angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _mpc_L_wheel
     (setq _mpc_L_wheel (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int8 _mpc_Np
     (setq _mpc_Np (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _mpc_Np 127) (setq _mpc_Np (- _mpc_Np 256)))
   ;; int8 _mpc_Nc
     (setq _mpc_Nc (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _mpc_Nc 127) (setq _mpc_Nc (- _mpc_Nc 256)))
   ;; float64[3] _mpc_Q
   (dotimes (i (length _mpc_Q))
     (setf (elt _mpc_Q i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[3] _mpc_Qp
   (dotimes (i (length _mpc_Qp))
     (setf (elt _mpc_Qp i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64 _mpc_R
     (setq _mpc_R (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _mpc_umax
     (setq _mpc_umax (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _mpc_umin
     (setq _mpc_umin (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int8 _refpoint_offset
     (setq _refpoint_offset (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _refpoint_offset 127) (setq _refpoint_offset (- _refpoint_offset 256)))
   ;; float64 _lqr_L_wheel
     (setq _lqr_L_wheel (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int8 _lqr_Np
     (setq _lqr_Np (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _lqr_Np 127) (setq _lqr_Np (- _lqr_Np 256)))
   ;; float64[3] _lqr_Q
   (dotimes (i (length _lqr_Q))
     (setf (elt _lqr_Q i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[3] _lqr_K
   (dotimes (i (length _lqr_K))
     (setf (elt _lqr_K i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64 _lqr_R
     (setq _lqr_R (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _lqr_umax
     (setq _lqr_umax (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _lqr_umin
     (setq _lqr_umin (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int8 _TrajectoryType
     (setq _TrajectoryType (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _TrajectoryType 127) (setq _TrajectoryType (- _TrajectoryType 256)))
   ;; int8 _numWaypoint
     (setq _numWaypoint (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _numWaypoint 127) (setq _numWaypoint (- _numWaypoint 256)))
   ;; float64 _lat_base
     (setq _lat_base (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _lng_base
     (setq _lng_base (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64[40] _X_point
   (dotimes (i (length _X_point))
     (setf (elt _X_point i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[40] _Y_point
   (dotimes (i (length _Y_point))
     (setf (elt _Y_point i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;;
   self)
  )

(setf (get ugv_msgs::toUGV :md5sum-) "1efb4b5a89c87d8d3553438208941e46")
(setf (get ugv_msgs::toUGV :datatype-) "ugv_msgs/toUGV")
(setf (get ugv_msgs::toUGV :definition-)
      "#0: update PID, 1: manual, 2: MPC, 3: LQR
uint8 mode
uint8 start_mode
uint8 send_parameters

#Parameters for PID
float64 Kp_steering
float64 Ki_steering 
float64 Kd_steering
float64 Kp_speed
float64 Ki_speed 
float64 Kd_speed

# Parameters for manual
float64 set_speed
float64 set_angle

# Parameters for MPC
float64 mpc_L_wheel
int8 mpc_Np
int8 mpc_Nc
float64[3] mpc_Q
float64[3] mpc_Qp
float64 mpc_R
float64 mpc_umax
float64 mpc_umin
int8 refpoint_offset

#Parameters for LQR
float64 lqr_L_wheel
int8 lqr_Np
float64[3] lqr_Q
float64[3] lqr_K
float64 lqr_R
float64 lqr_umax
float64 lqr_umin

int8 TrajectoryType #Line = 0

int8 numWaypoint   # number of waypoint except for base waypoint
float64 lat_base
float64 lng_base
float64[40] X_point
float64[40] Y_point

")



(provide :ugv_msgs/toUGV "1efb4b5a89c87d8d3553438208941e46")


