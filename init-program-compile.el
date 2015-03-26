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

;; 记录上次编译失败时的compilation-buffer
(defvar last-fail-compilation-buffer nil
  "上一次编译失败的compliation buffer")

(defun log-last-fail-compliation-buffer (buf msg)
  "记录下上一次编译失败的compliation buffer到`last-fail-compilation-buffer'中"
  (if (compilation-abnormally-exit-message-p msg)
	  (setq last-fail-compilation-buffer buf)
	(setq last-fail-compilation-buffer nil)))

(add-to-list 'compilation-finish-functions #'log-last-fail-compliation-buffer)
;; 使用smart-compile来编译
;; 通过smart-compile可以根据major-mode或文件名称来选择不同的compile-command
(require-and-install 'smart-compile)

;; F5执行编译
(defun set-compile-key()
  (local-set-key (kbd "<f5>") (lambda ()
								(interactive)
								(if (buffer-live-p last-fail-compilation-buffer)
									(recompile)
								  (smart-compile 1)))))

(add-hook 'prog-mode-hook #'set-compile-key)
;; (global-set-key (kbd "<f5>") (lambda ()
;; 							   (interactive)
;; 							   (if (buffer-live-p last-fail-compilation-buffer)
;; 								   (recompile)
;; 								 (smart-compile 1))))

















