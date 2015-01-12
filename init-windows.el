(add-to-list 'load-path "d:/myLisp/")
(add-to-list 'load-path "d:/emacs-init")
(add-to-list 'exec-path "d:/program files/emacs-24.3/bin/")
  (when window-system
    (setq frame-title-format '(buffer-file-name "%f" ("%b")))
    (blink-cursor-mode -1)
    (when (require 'mwheel nil 'no-error) (mouse-wheel-mode t)))
  
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)
  
  (setq visible-bell t
        echo-keystrokes 0.1
        font-lock-maximum-decoration t
        inhibit-startup-message t
        transient-mark-mode t
        color-theme-is-global t
        delete-by-moving-to-trash t
        shift-select-mode nil
        truncate-partial-width-windows nil
        uniquify-buffer-name-style 'forward
        whitespace-style '(trailing lines space-before-tab
                                    indentation space-after-tab)
        whitespace-line-column 100
        ediff-window-setup-function 'ediff-setup-windows-plain
	xterm-mouse-mode t)
        
;;每一个新开frame都自动最大化
(defun w32-restore-frame (&optional arg)
  "Restore a minimized frame"
  (interactive)
  (w32-send-sys-command 61728 arg))

(defun w32-maximize-frame (&optional arg)
  "Maximize the current frame"
  (interactive)
  (w32-send-sys-command 61488 arg))

(w32-maximize-frame)
(add-hook 'after-make-frame-functions 'w32-maximize-frame)
(setq after-insert-file-functions 'w32-maximuze-frame)
;(add-hook 'window-setup-hook 'w32-maximize-frame)
(org-babel-load-file "d:/CodeLibrary/elisp.org")
