(defun prelude-colorize-compilation-buffer ()
  "Colorize a compilation mode buffer."
  (interactive)
  ;; we don't want to mess with child modes such as grep-mode, ack, ag, etc
  (when (eq major-mode 'compilation-mode)
    (let ((inhibit-read-only t))
      (ansi-color-apply-on-region (point-min) (point-max)))))

;; 设置compile的默认命令
(setq compilation-always-kill t)
(setq compilation-auto-jump-to-first-error t)
(setq compilation-scroll-output t)
;; 若编译无错误,则自动关闭compilation窗口
(defun compilation-abnormally-exit-message-p (exit-message)
  (if (string-match-p "exited abnormally" exit-message)
	  t
	nil))

(defun compilation-mode-buffer-p (buf)
  "判断buffer是否为compilation-mode

它与`compilation-buffer-p'不同之处在于`compilation-buffer-p'会对compilation-mode的子mode也返回t,而该函数返回nil"
  (eq 'compilation-mode (buffer-local-value 'major-mode (get-buffer buf))))

(defun compilation-kill-buffer-when-compile-success(buf exit-message)
  (tooltip-show exit-message)
  (when  (and (not (compilation-abnormally-exit-message-p exit-message))
			  (compilation-mode-buffer-p buf))
	(kill-buffer buf)))

(add-to-list 'compilation-finish-functions #'compilation-kill-buffer-when-compile-success)
;; 使用smart-compile来编译
;; 通过smart-compile可以根据major-mode或文件名称来选择不同的compile-command
(require-and-install 'smart-compile)

;; F5执行编译
(defun compilation-mode-buffer-alive-p ()
  "是否有compilation-mode-buffer存在"
  (some #'compilation-mode-buffer-p (buffer-list)))

(global-set-key (kbd "<f5>") (lambda ()
							   (interactive)
							   (if (compilation-mode-buffer-alive-p)
								   (recompile)
								 (smart-compile 4)))) ;参数为4时,才重新生成compile-command,否则使用原先的compile-command













