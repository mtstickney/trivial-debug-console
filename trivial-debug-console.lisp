;;;; trivial-debug-console.lisp

(in-package #:trivial-debug-console)

(defun debug-handler (&optional (parent-hook *debugger-hook*))
  "Return a function to be used as *DEBUGGER-HOOK* that shows the console window, runs any existing hooks, and hides the window when debugging is complete."
  (lambda (condition hook)
    (let ((w (console-window)))
      ;; Show the console
      (when (not (cffi:null-pointer-p w))
        (show-window w :restore))
      ;; Run the existing hook/enter the standard debugger
      (unwind-protect (progn (when parent-hook
                               (funcall parent-hook condition parent-hook))
                             (invoke-debugger condition))
        (when (not (cffi:null-pointer-p w))
          (show-window w :hide))))))

(defun debuggify (func &rest args)
  (let* ((*debugger-hook* (debug-handler)))
    (apply func args)))

(defmacro with-debug-console (&body body)
  `(debuggify (lambda () ,@body)))
