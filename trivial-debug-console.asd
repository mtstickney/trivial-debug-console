;;;; trivial-debug-console.asd

(asdf:defsystem #:trivial-debug-console
  :serial t
  :description "A library for a well-behaved debug console"
  :author "Matthew Stickney <mtstickney@gmail.com>"
  :license "Specify license here"
  :depends-on (:cffi)
  :components ((:file "package")
               (:file "ffi")
               (:file "trivial-debug-console")))
