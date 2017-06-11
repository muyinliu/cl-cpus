# cl-cpus

cl-cpus is a Common Lisp feature to get number of CPUs.

## License

Copyright (c) 2017 Muyinliu Xing
Released under the ISC License.

## Compatibility
|  Common Lisp  |  Linux  |  Mac |  Unix | Windows |
|---------------|:-------:|:----:|:-----:|:-------:|
|  SBCL         |   Yes   |  Yes |       |   Yes   |

Note: I don't have Unix system so haven't test on Unix yet.

## Install and load with QuickLisp

In shell:
```shell
git clone https://github.com/muyinliu/cl-cpus.git
cp -r cl-cpus ~/quicklisp/local-projects/
```

In Common Lisp: 
```lisp
(ql:quickload 'cl-cpus)
```

## Usage
```lisp
(cpus:get-number-of-processors)
```
will get number of CPUs:
```=>
8
```
