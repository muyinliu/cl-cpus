;;;; cl-cpus.asd

(asdf:defsystem "cl-cpus"
  :name "cpus"
  :description "Get number of CPUs"
  :version "0.0.2"
  :author "Muyinliu Xing <muyinliu@gmail.com>"
  :license "ISC"
  :serial t
  :depends-on ("cffi")
  :components
  ((:file "packages")
   #+linux
   (:file "cl-cpus-linux")
   #+(or bsd freebsd darwin)
   (:file "cl-cpus-bsd")
   #+(or win32 windows)
   (:file "cl-cpus-win32")))
