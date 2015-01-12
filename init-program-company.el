;;配置company-mode
(require 'company)
;; 提供头文件的补全
(setq company-backends (remove 'company-clang company-backends))
(add-to-list 'company-backends 'company-c-headers)
;; 提供系统的头文件地址,要提供项目的目录,则可以在.dir-loclas.el中定义company-c-headers-path-user变量
(when (eq system-type 'windows-nt)
  (add-to-list 'company-c-headers-path-system "D:/Program Files/DEV-CPP/Include/c++/3.4.2"))


