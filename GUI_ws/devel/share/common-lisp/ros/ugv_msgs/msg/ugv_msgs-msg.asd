
(cl:in-package :asdf)

(defsystem "ugv_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "IMU_calib" :depends-on ("_package_IMU_calib"))
    (:file "_package_IMU_calib" :depends-on ("_package"))
    (:file "toGUI" :depends-on ("_package_toGUI"))
    (:file "_package_toGUI" :depends-on ("_package"))
    (:file "toUGV" :depends-on ("_package_toUGV"))
    (:file "_package_toUGV" :depends-on ("_package"))
  ))