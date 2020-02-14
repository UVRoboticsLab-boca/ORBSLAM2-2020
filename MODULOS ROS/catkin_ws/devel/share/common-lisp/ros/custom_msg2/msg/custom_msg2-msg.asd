
(cl:in-package :asdf)

(defsystem "custom_msg2-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "KeyPoint" :depends-on ("_package_KeyPoint"))
    (:file "_package_KeyPoint" :depends-on ("_package"))
    (:file "Point2f" :depends-on ("_package_Point2f"))
    (:file "_package_Point2f" :depends-on ("_package"))
    (:file "custom_msg" :depends-on ("_package_custom_msg"))
    (:file "_package_custom_msg" :depends-on ("_package"))
  ))