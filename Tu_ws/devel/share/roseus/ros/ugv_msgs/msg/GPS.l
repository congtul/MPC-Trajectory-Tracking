;; Auto-generated. Do not edit!


(when (boundp 'ugv_msgs::GPS)
  (if (not (find-package "UGV_MSGS"))
    (make-package "UGV_MSGS"))
  (shadow 'GPS (find-package "UGV_MSGS")))
(unless (find-package "UGV_MSGS::GPS")
  (make-package "UGV_MSGS::GPS"))

(in-package "ROS")
;;//! \htmlinclude GPS.msg.html


(defclass ugv_msgs::GPS
  :super ros::object
  :slots (_lat _lng _speed ))

(defmethod ugv_msgs::GPS
  (:init
   (&key
    ((:lat __lat) 0.0)
    ((:lng __lng) 0.0)
    ((:speed __speed) 0.0)
    )
   (send-super :init)
   (setq _lat (float __lat))
   (setq _lng (float __lng))
   (setq _speed (float __speed))
   self)
  (:lat
   (&optional __lat)
   (if __lat (setq _lat __lat)) _lat)
  (:lng
   (&optional __lng)
   (if __lng (setq _lng __lng)) _lng)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; float64 _lat
    8
    ;; float64 _lng
    8
    ;; float64 _speed
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _lat
       (sys::poke _lat (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _lng
       (sys::poke _lng (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _lat
     (setq _lat (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _lng
     (setq _lng (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _speed
     (setq _speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get ugv_msgs::GPS :md5sum-) "e4f65926ca53cfcca37eb08ca1f88642")
(setf (get ugv_msgs::GPS :datatype-) "ugv_msgs/GPS")
(setf (get ugv_msgs::GPS :definition-)
      "float64 lat
float64 lng
float64 speed

")



(provide :ugv_msgs/GPS "e4f65926ca53cfcca37eb08ca1f88642")


