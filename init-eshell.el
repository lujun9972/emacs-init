;; 配置在windows下使用bash的shell-mode
(setq explicit-shell-file-name "C:/Program Files/Git/bin/bash.exe")
(setq shell-file-name "bash")
(setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
(setenv "SHELL" shell-file-name)
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
;; 配置eshell
(require 'eshell)
(require-and-install 'em-smart)
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)
;; ;; 设置命令提示行为[登录名]:路径>
;; (setq eshell-prompt-function (lambda ()
;; 	  (concat
;; 	   "[" (user-login-name) "]"
;; 	   (abbreviate-file-name
;; 		(eshell/pwd))
;; 	   (if
;; 		   (=
;; 			(user-uid)
;; 			0)
;; 		   "#" ">"))))
;; (setq eshell-prompt-regexp "^\[.+\]:[^#>]*[#>]")

(add-hook
 'eshell-mode-hook
 (lambda ()
   (setq pcomplete-cycle-completions nil)))

;; change listing switches based on OS
;; (when (not (eq system-type 'windows-nt))
;;   (eshell/alias "ls" "ls --color -h --group-directories-first $*"))
;; 定义clear函数
(defun eshell/clear ()  
  "clear the eshell buffer."  
  (interactive)  
  (let ((inhibit-read-only t))  
    (erase-buffer)))  

(provide 'init-eshell)
