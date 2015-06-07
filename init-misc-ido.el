;; 开启ido-mode
(when (> emacs-major-version 21)
  (ido-mode 'both)
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t 
        ido-everywhere t
		ido-max-directory-size 100000
        ido-create-new-buffer 'always
		;; Use the current window when visiting files and buffers with ido
		ido-default-file-method 'selected-window
		ido-default-buffer-method 'selected-window
        ido-use-filename-at-point nil
		ido-auto-merge-work-directories-length 0
		ido-use-virtual-buffers t)
  
  (add-to-list 'ido-ignore-directories "\\`\\.git/")
  (add-to-list 'ido-ignore-files "\\~\\`")
  (add-to-list 'ido-ignore-files "\\.doc\\`"))
;; Use ido (nearly) everywhere
(package-install-new 'ido-ubiquitous)
(ido-ubiquitous-mode t)
;; imenu tag selection with ido
(package-install-new 'idomenu)

;; 若打开文件没有权限,自动使用sudo方式打开
(defun alternate-current-file-as-root (&rest args)
  "以sudo方式打开当前buffer文件"
  (interactive)
  (let ((file (buffer-file-name)))
	(when (and file
			   (not (file-writable-p file))
			   (not (file-remote-p file))
			   (y-or-n-p-with-timeout "是否使用sudo方式打开当前文件" 10 "n"))
	  (find-alternate-file (concat "/sudo::" file)))))
(advice-add 'ido-find-file :after #'alternate-current-file-as-root)
(provide 'init-misc-ido)
