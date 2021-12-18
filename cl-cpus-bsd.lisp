(in-package :cl-cpus)

(defconstant +ctl-hw+ 6)
(defconstant +hw-ncpu+ 3)

;; int sysctl(int *name, u_int namelen, void *oldp, size_t *oldlenp, void *newp,
;;            size_t newlen);
(cffi:defcfun "sysctl" :int
  (name    :pointer)
  (namelen :unsigned-int)
  (oldp    :pointer)
  (oldlenp :pointer)
  (newp    :pointer)
  (newlen  :unsigned-int))

(defvar *number-of-processors*
  (cffi:with-foreign-object (name-pointer :int 2)
    (setf (cffi:mem-aref name-pointer :int 0) +ctl-hw+)
    (setf (cffi:mem-aref name-pointer :int 1) +hw-ncpu+)
    (cffi:with-foreign-objects ((oldp :uint)
                                (oldlenp :size))
      (setf (cffi:mem-ref oldlenp :size) (cffi:foreign-type-size :uint))
      (let ((result (sysctl name-pointer 2 oldp oldlenp (cffi:null-pointer) 0)))
        (if (/= 0 result)
            0
            (cffi:mem-ref oldp :uint))))))

(defun get-number-of-processors ()
  "Get CPU Threads count."
  *number-of-processors*)
