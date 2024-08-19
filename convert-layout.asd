;;;; convert-layout.asd

(asdf:defsystem #:convert-layout
  :description "This system will change the layout manager of a group."
  :author "Mark W. Naylor <mark.naylor.1701@gmail.com>"
  :license  "BSD 3-Clause License"
  :Version "0.5."
  :serial t
  :depends-on (#:stumpwm)
  :components ((:file "package")
               (:file "convert-layout")))
