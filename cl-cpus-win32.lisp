(in-package :cl-cpus)

(cffi:define-foreign-library kernel32
  (:windows "C:/WINDOWS/system32/kernel32.dll"))

(cffi:use-foreign-library kernel32)

;; C++ Syntax from https://msdn.microsoft.com/en-us/library/windows/desktop/ms724958(v=vs.85).aspx
;; typedef struct _SYSTEM_INFO {
;;   union {
;;     DWORD  dwOemId;
;;     struct {
;;       WORD wProcessorArchitecture;
;;       WORD wReserved;
;;     };
;;   };
;;   DWORD     dwPageSize;
;;   LPVOID    lpMinimumApplicationAddress;
;;   LPVOID    lpMaximumApplicationAddress;
;;   DWORD_PTR dwActiveProcessorMask;
;;   DWORD     dwNumberOfProcessors;
;;   DWORD     dwProcessorType;
;;   DWORD     dwAllocationGranularity;
;;   WORD      wProcessorLevel;
;;   WORD      wProcessorRevision;
;; } SYSTEM_INFO;

(cffi:defctype dword :unsigned-long)
(cffi:defctype word :unsigned-short)

(cffi:defcstruct processor-struct
  (processor-architecture word)
  (reserved word))

(cffi:defcunion oem-union
  (oem-ide dword)
  (processor-struct (:struct processor-struct)))

(cffi:defcstruct system-info
  (oem-info (:union oem-union))
  (page-size dword)
  (minimum-application-address :pointer)
  (maximum-application-address :pointer)
  (active-processor-mask (:pointer dword))
  (number-of-processors dword)
  (processor-type dword)
  (allocation-granularity dword)
  (processor-level word)
  (processor-revision word))

;; C++ Syntax from https://msdn.microsoft.com/en-us/library/windows/desktop/ms724381(v=vs.85).aspx
;; void WINAPI GetSystemInfo(
;;   _Out_ LPSYSTEM_INFO lpSystemInfo
;; );

(cffi:defcfun ("GetSystemInfo" get-system-info) :void
  (data (:pointer (:struct system-info))))

(defvar *number-of-processors*
  (cffi:with-foreign-object (info '(:struct system-info))
    (get-system-info info)
    (cffi:foreign-slot-value info '(:struct system-info)
                             'number-of-processors)))

(defun get-number-of-processors ()
  "Get CPU Threads count."
  *number-of-processors*)
