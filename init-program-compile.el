(defun prelude-colorize-compilation-buffer ()
  "Colorize a compilation mode buffer."
  (interactive)
  ;; we don't want to mess with child modes such as grep-mode, ack, ag, etc
  (when (eq major-mode 'compilation-mode)
    (let ((inhibit-read-only t))
      (ansi-color-apply-on-region (point-min) (point-max)))))

;; 设置compile的默认命令
(setq compile-command "make")
(setq compilation-always-kill t)
(setq compilation-auto-jump-to-first-error t)
(setq compilation-scroll-output t)
;; 若编译无错误,则自动关闭compilation窗口
(defun compilation-abnormally-exit-message-p (exit-message)
  (if (string-match "exited abnormally" exit-message)
	  t
	nil))
(defun compilation-kill-buffer-when-compile-success(compilation-buffer exit-message)
  (unless  (compilation-abnormally-exit-message-p exit-message)
	(kill-buffer compilation-buffer)))

(add-to-list 'compilation-finish-functions #'compilation-kill-buffer-when-compile-success)
;; F5执行编译
(global-set-key (kbd "<f5>") 'compile)
