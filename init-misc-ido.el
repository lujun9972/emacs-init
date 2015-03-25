
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
        ido-use-filename-at-point nil)
  
  (add-to-list 'ido-ignore-directories "\\`\\.git/")
  (add-to-list 'ido-ignore-files "\\~\\`")
  (add-to-list 'ido-ignore-files "\\.doc\\`"))

