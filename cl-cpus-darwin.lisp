(in-package :cl-cpus)

(defconstant +sc-nprocessors-onln+ 58)

;; static long int posix_sysconf (int name);
(cffi:defcfun "sysconf" :long
  (name :int))

(defun get-number-of-processors ()
  (sysconf +sc-nprocessors-onln+))
