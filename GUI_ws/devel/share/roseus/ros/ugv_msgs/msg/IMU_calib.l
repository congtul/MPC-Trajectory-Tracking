;; Auto-generated. Do not edit!


(when (boundp 'ugv_msgs::IMU_calib)
  (if (not (find-package "UGV_MSGS"))
    (make-package "UGV_MSGS"))
  (shadow 'IMU_calib (find-package "UGV_MSGS")))
(unless (find-package "UGV_MSGS::IMU_CALIB")
  (make-package "UGV_MSGS::IMU_CALIB"))

(in-package "ROS")
;;//! \htmlinclude IMU_calib.msg.html


(defclass ugv_msgs::IMU_calib
  :super ros::object
  :slots (_parameters _mode ))

(defmethod ugv_msgs::IMU_calib
  (:init
   (&key
    ((:parameters __parameters) 0.0)
    ((:mode __mode) 0)
    )
   (send-super :init)
   (setq _parameters (float __parameters))
   (setq _mode (round __mode))
   self)
  (:parameters
   (&optional __parameters)
   (if __parameters (setq _parameters __parameters)) _parameters)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:serialization-length
   ()
   (+
    ;; float64 _parameters
    8
    ;; int8 _mode
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _parameters
       (sys::poke _parameters (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int8 _mode
       (write-byte _mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _parameters
     (setq _parameters (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int8 _mode
     (setq _mode (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _mode 127) (setq _mode (- _mode 256)))
   ;;
   self)
  )

(setf (get ugv_msgs::IMU_calib :md5sum-) "8a20590408efba6d64d7d538c77eb428")
(setf (get ugv_msgs::IMU_calib :datatype-) "ugv_msgs/IMU_calib")
(setf (get ugv_msgs::IMU_calib :definition-)
      "float64 parameters
int8 mode
")



(provide :ugv_msgs/IMU_calib "8a20590408efba6d64d7d538c77eb428")


