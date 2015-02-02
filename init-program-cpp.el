;;配置cc-mode
;;;Sqc也看成是C++模式
(add-to-list 'auto-mode-alist '("\\.Sqc\\'" . c++-mode))
;; (add-hook 'c++-mode-hook 'c-guess)		;自动猜测原代码风格,修改时保持风格不变
;;设置C++风格为linux格式
(setq c-default-style '((c++-mode . "linux")
						(java-mode . "java"))
	  c-basic-offset 4)

;; 使用hs-minor-mode进行折叠,
(add-hook 'c-mode-common-hook   'hs-minor-mode)
;; 取消使用ac进行补全,使用semantic进行补全
(add-hook 'c-mode-common-hook  (lambda ()
								 (enable-prefer-mode 'semantic-mode 'auto-complete-mode)))

(defun set-c-mode-keys()
  (local-set-key  (kbd ".") 'semantic-complete-self-insert)
  (local-set-key  (kbd ">") 'semantic-complete-self-insert))
(add-hook 'c-mode-common-hook 'set-c-mode-keys)
