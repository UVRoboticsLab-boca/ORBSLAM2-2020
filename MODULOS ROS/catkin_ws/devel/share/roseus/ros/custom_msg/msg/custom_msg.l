;; Auto-generated. Do not edit!


(when (boundp 'custom_msg::custom_msg)
  (if (not (find-package "CUSTOM_MSG"))
    (make-package "CUSTOM_MSG"))
  (shadow 'custom_msg (find-package "CUSTOM_MSG")))
(unless (find-package "CUSTOM_MSG::CUSTOM_MSG")
  (make-package "CUSTOM_MSG::CUSTOM_MSG"))

(in-package "ROS")
;;//! \htmlinclude custom_msg.msg.html


(defclass custom_msg::custom_msg
  :super ros::object
  :slots (_points ))

(defmethod custom_msg::custom_msg
  (:init
   (&key
    ((:points __points) (let (r) (dotimes (i 0) (push (instance custom_msg::KeyPoint :init) r)) r))
    )
   (send-super :init)
   (setq _points __points)
   self)
  (:points
   (&rest __points)
   (if (keywordp (car __points))
       (send* _points __points)
     (progn
       (if __points (setq _points (car __points)))
       _points)))
  (:serialization-length
   ()
   (+
    ;; custom_msg/KeyPoint[] _points
    (apply #'+ (send-all _points :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; custom_msg/KeyPoint[] _points
     (write-long (length _points) s)
     (dolist (elem _points)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; custom_msg/KeyPoint[] _points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _points (let (r) (dotimes (i n) (push (instance custom_msg::KeyPoint :init) r)) r))
     (dolist (elem- _points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get custom_msg::custom_msg :md5sum-) "6ad34cde040acacc9804ee0e0a8850d5")
(setf (get custom_msg::custom_msg :datatype-) "custom_msg/custom_msg")
(setf (get custom_msg::custom_msg :definition-)
      "custom_msg/KeyPoint[] points

================================================================================
MSG: custom_msg/KeyPoint
custom_msg/Point2f pt
float32 size
float32 angle
float32 response
int32 octave
int32 class_id


================================================================================
MSG: custom_msg/Point2f
float32 x
float32 y


")



(provide :custom_msg/custom_msg "6ad34cde040acacc9804ee0e0a8850d5")


