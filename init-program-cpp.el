;;配置cc-mode
;; (add-hook 'c++-mode-hook 'c-guess)		;自动猜测原代码风格,修改时保持风格不变
;;设置C++风格为linux格式
(setq c-default-style '((c++-mode . "linux")
						(java-mode . "java"))
	  c-basic-offset 4)

;; 取消使用ac进行补全,使用semantic进行补全
;; (add-hook 'c-mode-common-hook  (lambda ()
;; 								 (enable-prefer-mode 'semantic-mode 'auto-complete-mode)))

;; 设置tab用来缩进或插入tab
(setq c-tab-always-indent nil
      c-insert-tab-function 'indent-for-tab-command)

(defun set-c-mode-keys()
  (local-set-key  (kbd ".") 'semantic-complete-self-insert)
  (local-set-key  (kbd ">") 'semantic-complete-self-insert))
(add-hook 'c-mode-common-hook 'set-c-mode-keys)

;; 使用flymake-cppcheck动态检查代码质量
(sudo-apt-get-install "cppcheck")
(when (executable-find "cppcheck")
  (require-and-install 'flymake-cppcheck)
  ;; 开启flymake-cppcheck
  (add-hook 'c-mode-hook 'flymake-cppcheck-load)
  (add-hook 'c++-mode-hook 'flymake-cppcheck-load)
  (setq flymake-cppcheck-enable "warning"
		flymake-cppcheck-location 'tempdir)
  )

(provide 'init-program-cpp)
