;; Auto-generated. Do not edit!


(when (boundp 'ugv_msgs::toGUI)
  (if (not (find-package "UGV_MSGS"))
    (make-package "UGV_MSGS"))
  (shadow 'toGUI (find-package "UGV_MSGS")))
(unless (find-package "UGV_MSGS::TOGUI")
  (make-package "UGV_MSGS::TOGUI"))

(in-package "ROS")
;;//! \htmlinclude toGUI.msg.html


(defclass ugv_msgs::toGUI
  :super ros::object
  :slots (_lat_postion _lng_postion _x _y _set_speed _speed_left _speed_right _yaw _set_steering _steering _num_mpc_refpath _x_mpc_repath _y_mpc_repath _yaw_mpc_repath ))

(defmethod ugv_msgs::toGUI
  (:init
   (&key
    ((:lat_postion __lat_postion) 0.0)
    ((:lng_postion __lng_postion) 0.0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:set_speed __set_speed) 0.0)
    ((:speed_left __speed_left) 0.0)
    ((:speed_right __speed_right) 0.0)
    ((:yaw __yaw) 0.0)
    ((:set_steering __set_steering) 0.0)
    ((:steering __steering) 0.0)
    ((:num_mpc_refpath __num_mpc_refpath) 0)
    ((:x_mpc_repath __x_mpc_repath) (make-array 20 :initial-element 0.0 :element-type :float))
    ((:y_mpc_repath __y_mpc_repath) (make-array 20 :initial-element 0.0 :element-type :float))
    ((:yaw_mpc_repath __yaw_mpc_repath) (make-array 20 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _lat_postion (float __lat_postion))
   (setq _lng_postion (float __lng_postion))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _set_speed (float __set_speed))
   (setq _speed_left (float __speed_left))
   (setq _speed_right (float __speed_right))
   (setq _yaw (float __yaw))
   (setq _set_steering (float __set_steering))
   (setq _steering (float __steering))
   (setq _num_mpc_refpath (round __num_mpc_refpath))
   (setq _x_mpc_repath __x_mpc_repath)
   (setq _y_mpc_repath __y_mpc_repath)
   (setq _yaw_mpc_repath __yaw_mpc_repath)
   self)
  (:lat_postion
   (&optional __lat_postion)
   (if __lat_postion (setq _lat_postion __lat_postion)) _lat_postion)
  (:lng_postion
   (&optional __lng_postion)
   (if __lng_postion (setq _lng_postion __lng_postion)) _lng_postion)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:set_speed
   (&optional __set_speed)
   (if __set_speed (setq _set_speed __set_speed)) _set_speed)
  (:speed_left
   (&optional __speed_left)
   (if __speed_left (setq _speed_left __speed_left)) _speed_left)
  (:speed_right
   (&optional __speed_right)
   (if __speed_right (setq _speed_right __speed_right)) _speed_right)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:set_steering
   (&optional __set_steering)
   (if __set_steering (setq _set_steering __set_steering)) _set_steering)
  (:steering
   (&optional __steering)
   (if __steering (setq _steering __steering)) _steering)
  (:num_mpc_refpath
   (&optional __num_mpc_refpath)
   (if __num_mpc_refpath (setq _num_mpc_refpath __num_mpc_refpath)) _num_mpc_refpath)
  (:x_mpc_repath
   (&optional __x_mpc_repath)
   (if __x_mpc_repath (setq _x_mpc_repath __x_mpc_repath)) _x_mpc_repath)
  (:y_mpc_repath
   (&optional __y_mpc_repath)
   (if __y_mpc_repath (setq _y_mpc_repath __y_mpc_repath)) _y_mpc_repath)
  (:yaw_mpc_repath
   (&optional __yaw_mpc_repath)
   (if __yaw_mpc_repath (setq _yaw_mpc_repath __yaw_mpc_repath)) _yaw_mpc_repath)
  (:serialization-length
   ()
   (+
    ;; float64 _lat_postion
    8
    ;; float64 _lng_postion
    8
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _set_speed
    4
    ;; float32 _speed_left
    4
    ;; float32 _speed_right
    4
    ;; float32 _yaw
    4
    ;; float32 _set_steering
    4
    ;; float32 _steering
    4
    ;; int8 _num_mpc_refpath
    1
    ;; float32[20] _x_mpc_repath
    (* 4    20)
    ;; float32[20] _y_mpc_repath
    (* 4    20)
    ;; float32[20] _yaw_mpc_repath
    (* 4    20)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _lat_postion
       (sys::poke _lat_postion (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _lng_postion
       (sys::poke _lng_postion (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _set_speed
       (sys::poke _set_speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _speed_left
       (sys::poke _speed_left (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _speed_right
       (sys::poke _speed_right (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _set_steering
       (sys::poke _set_steering (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _steering
       (sys::poke _steering (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int8 _num_mpc_refpath
       (write-byte _num_mpc_refpath s)
     ;; float32[20] _x_mpc_repath
     (dotimes (i 20)
       (sys::poke (elt _x_mpc_repath i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[20] _y_mpc_repath
     (dotimes (i 20)
       (sys::poke (elt _y_mpc_repath i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[20] _yaw_mpc_repath
     (dotimes (i 20)
       (sys::poke (elt _yaw_mpc_repath i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _lat_postion
     (setq _lat_postion (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _lng_postion
     (setq _lng_postion (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _set_speed
     (setq _set_speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _speed_left
     (setq _speed_left (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _speed_right
     (setq _speed_right (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _set_steering
     (setq _set_steering (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _steering
     (setq _steering (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int8 _num_mpc_refpath
     (setq _num_mpc_refpath (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _num_mpc_refpath 127) (setq _num_mpc_refpath (- _num_mpc_refpath 256)))
   ;; float32[20] _x_mpc_repath
   (dotimes (i (length _x_mpc_repath))
     (setf (elt _x_mpc_repath i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[20] _y_mpc_repath
   (dotimes (i (length _y_mpc_repath))
     (setf (elt _y_mpc_repath i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[20] _yaw_mpc_repath
   (dotimes (i (length _yaw_mpc_repath))
     (setf (elt _yaw_mpc_repath i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get ugv_msgs::toGUI :md5sum-) "4a28929b5edb2cd02f7ac9cd5152eccc")
(setf (get ugv_msgs::toGUI :datatype-) "ugv_msgs/toGUI")
(setf (get ugv_msgs::toGUI :definition-)
      "#GPS Data 
float64 lat_postion
float64 lng_postion
float32 x
float32 y
float32 set_speed
float32 speed_left
float32 speed_right

#IMU Data 
#float32 roll
#float32 pitch
float32 yaw

#Controll Data
float32 set_steering
float32 steering
int8 num_mpc_refpath
float32[20] x_mpc_repath
float32[20] y_mpc_repath
float32[20] yaw_mpc_repath
")



(provide :ugv_msgs/toGUI "4a28929b5edb2cd02f7ac9cd5152eccc")


