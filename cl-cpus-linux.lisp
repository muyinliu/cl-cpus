(in-package :cl-cpus)

(defconstant +sc-nprocessors-onln+ 84)

;; static long int posix_sysconf (int name);
(cffi:defcfun "sysconf" :long
  (name :int))

(defvar *number-of-processors* (sysconf +sc-nprocessors-onln+))

(defun get-number-of-processors ()
  "Get CPU Threads count."
  *number-of-processors*)
