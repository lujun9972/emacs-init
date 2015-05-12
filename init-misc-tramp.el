;;设置tramp
(require 'tramp)						;开启tramp
(pcase system-type
  (`windows-nt (add-to-list 'load-path "e:/myLisp/")) ; 配置windows下使用emacs
  (`cygwin (add-to-list 'load-path "~/MyLisp/")) ; 配置cygwin
  (`gnu/linux (add-to-list 'load-path "~/MyLisp/")))

(setq autoftp-local-remote-root-alist '(("e:/git-svn/server/" "cnaps2" "10.8.6.10" "")
									 ("/cygdrive/e/git-svn/server/" "cnaps2" "10.8.6.10" "")
									 ("~/trunk/" "cnaps2" "10.8.6.10" "")
									 ("d:/workcvs/ibps/ibps" "ibpsusr" "10.8.6.10" "")))
(require 'autoftp)						;开启自动上传功能

(provide 'init-misc-tramp)
