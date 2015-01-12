
;;eldoc编辑elisp时提示
(require 'eldoc)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;;设置lisp的命令地址
(setq inferior-lisp-program "C:/Program Files/clisp-2.49/clisp.exe")
