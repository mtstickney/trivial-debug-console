;;;; trivial-debug-console.asd

(asdf:defsystem #:trivial-debug-console
  :serial t
  :description "A library to provide a well-behaved debug console."
  :author "Matthew Stickney <mtstickney@gmail.com>"
  :license "MIT"
  :depends-on (:cffi)
  :components ((:file "package")
               (:file "ffi")
               (:file "trivial-debug-console")))
