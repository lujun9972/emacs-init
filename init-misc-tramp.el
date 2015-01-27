;;设置tramp
(require 'tramp)						;开启tramp
(pcase system-type
  (`windows-nt (add-to-list 'load-path "e:/myLisp/")) ; 配置windows下使用emacs
  (`cygwin (add-to-list 'load-path "~/MyLisp/")) ; 配置cygwin
  (`gnu/linux (add-to-list 'load-path "~/MyLisp/")))

(require 'autoftp)						;开启自动上传功能
