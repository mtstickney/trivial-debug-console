;;;; trivial-debug-console.asd

(asdf:defsystem #:trivial-debug-console
  :serial t
  :description "Describe cl-debug-console here"
  :author "Your Name <your.name@example.com>"
  :license "Specify license here"
  :depends-on (:cffi)
  :components ((:file "package")
               (:file "ffi")
               (:file "trivial-debug-console")))
