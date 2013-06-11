;;;; trivial-debug-console.lisp

(in-package #:trivial-debug-console)

;; TODO: don't clobber the previous window state
;; TODO: Handle the case of a null console better (e.g. GUI apps)
(defmacro with-console ((window) &body body)
  (let ((window-var (gensym)))
    `(let ((,window-var ,window))
       (when (not (cffi:null-pointer-p ,window-var))
         (show-window ,window-var :restore))
       (unwind-protect (progn ,@body)
         (when (not (cffi:null-pointer-p ,window-var))
           (show-window ,window-var :hide))))))

(defun debug-handler (&optional (parent-hook *debugger-hook*))
  "Return a function to be used as *DEBUGGER-HOOK* that shows the console window, runs any existing hooks, and hides the window when debugging is complete."
  (lambda (condition hook)
    (let ((w (console-window)))
      (with-console (w)
        (when parent-hook
          (funcall parent-hook condition parent-hook))
        (invoke-debugger condition)))))

(defun debuggify (func &rest args)
  (let* ((*debugger-hook* (debug-handler)))
    (apply func args)))

(defmacro with-debug-console (&body body)
  `(debuggify (lambda () ,@body)))
