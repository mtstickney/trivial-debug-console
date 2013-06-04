(in-package #:cl-debug-console)

;;; FFI definitions for GetConsoleWindow and ShowWindow
(cffi:define-foreign-library kernel32
  ((:win32 :mswindows) "kernel32.dll"))

(cffi:define-foreign-library user32
  ((:win32 :mswindows) "user32.dll"))

(cffi:use-foreign-library kernel32)
(cffi:use-foreign-library user32)

(cffi:defcenum show-type
  (:hide 0)
  (:maximize 3)
  (:minimize 6)
  (:restore 9)
  (:show 5)
  (:force-minimize 11)
  (:show-maximized 3)
  (:show-minimized 2)
  (:show-min-no-active 7)
  (:show-na 8)
  (:show-no-activate 4)
  (:show-normal 1))

(cffi:defcfun (console-window "GetConsoleWindow" :library kernel32) :pointer
  "Return a handle to the calling process's console window.")

(cffi:defcfun (show-window "ShowWindow" :library user32) :int
  "Set the show state of the specified window."
  (hwnd :pointer)
  (type show-type))
