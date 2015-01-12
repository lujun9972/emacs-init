
;; 开启ido-mode
(when (> emacs-major-version 21)
  (ido-mode 1)
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t 
        ido-everywhere t
        ido-create-new-buffer 'always
		ido-default-file-method 'selected-window
        ido-use-filename-at-point 'guess)
  
  (add-to-list 'ido-ignore-directories "\\`\\.git/")
  (add-to-list 'ido-ignore-files "\\~\\`")
  (add-to-list 'ido-ignore-files "\\.doc\\`"))
