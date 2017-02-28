
(cl:in-package :asdf)

(defsystem "alma_ros_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "AlmaDB" :depends-on ("_package_AlmaDB"))
    (:file "_package_AlmaDB" :depends-on ("_package"))
    (:file "AlmaFmla" :depends-on ("_package_AlmaFmla"))
    (:file "_package_AlmaFmla" :depends-on ("_package"))
  ))