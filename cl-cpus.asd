;;;; cl-cpus.asd

(asdf:defsystem #:cl-cpus
  :name "cpus"
  :description "Get number of CPUs"
  :version "0.0.1"
  :author "Muyinliu Xing <muyinliu@gmail.com>"
  :license "ISC"
  :serial t
  :depends-on (:cffi)
  :components
  ((:file "packages")
   #+linux
   (:file "cl-cpus-linux")
   #+darwin
   (:file "cl-cpus-darwin")
   #+(and (not darwin) (or bsd freebsd))
   (:file "cl-cpus-bsd")
   #+win32
   (:file "cl-cpus-win32")))
