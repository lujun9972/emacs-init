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

;; 使用smart-compile来编译
;; 通过smart-compile可以根据major-mode或文件名称来选择不同的compile-command
(require-and-install 'smart-compile)
;; 编译sendtonps
(add-to-list 'smart-compile-alist
			 '("sendnps.+\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/nps;make sendtonps\""))
(add-to-list 'smart-compile-alist
			 '("sendnps.+\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/nps;make sendtonps\""))

;; 编译recvfromnps
(add-to-list 'smart-compile-alist
			 '("recvnps.+\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/nps;make recvfromnps\""))
(add-to-list 'smart-compile-alist
			 '("recvnps.+\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/nps;make recvfromnps\""))

;; 编译sendtobeps
(add-to-list 'smart-compile-alist
			 '("sendbeps.+\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/beps;make sendtobeps\""))
(add-to-list 'smart-compile-alist
			 '("sendbeps.+\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/beps;make sendtobeps\""))

;; 编译recvfrombeps
(add-to-list 'smart-compile-alist
			 '("recvbeps.+\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/beps;make recvfrombeps\""))
(add-to-list 'smart-compile-alist
			 '("recvbeps.+\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/beps;make recvfrombeps\""))

;; 编译sendtohvps
(add-to-list 'smart-compile-alist
			 '("sendhvps.+\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/hvps;make sendtohvps\""))
(add-to-list 'smart-compile-alist
			 '("sendhvps.+\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/hvps;make sendtohvps\""))

;; 编译recvfromhvps
(add-to-list 'smart-compile-alist
			 '("recvhvps.+\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/hvps;make recvfromhvps\""))
(add-to-list 'smart-compile-alist
			 '("recvhvps.+\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/hvps;make recvfromhvps\""))

;; 编译sendtoccms
(add-to-list 'smart-compile-alist
			 '("sendccms.+\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/ccms;make sendtoccms\""))
(add-to-list 'smart-compile-alist
			 '("sendccms.+\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/ccms;make sendtoccms\""))

;; 编译recvfromccms
(add-to-list 'smart-compile-alist
			 '("recvccms.+\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/ccms;make recvfromccms\""))
(add-to-list 'smart-compile-alist
			 '("recvccms.+\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/ccms;make recvfromccms\""))

;; 编译sendtosaps
(add-to-list 'smart-compile-alist
			 '("sendsaps.+\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/saps;make sendtosaps\""))
(add-to-list 'smart-compile-alist
			 '("sendsaps.+\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/saps;make sendtosaps\""))

;; 编译recvfromsaps
(add-to-list 'smart-compile-alist
			 '("recvsaps.+\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/saps;make recvfromsaps\""))
(add-to-list 'smart-compile-alist
			 '("recvsaps.+\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/saps;make recvfromsaps\""))

;; 编译sendtomb
(add-to-list 'smart-compile-alist
			 '("sendmb.+\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/mb;make sendtomb\""))
(add-to-list 'smart-compile-alist
			 '("sendmb.+\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/mb;make sendtomb\""))

;; 编译recvfrommb
(add-to-list 'smart-compile-alist
			 '("recvmb.+\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/mb;make recvfrommb;make recvfromclt\""))
(add-to-list 'smart-compile-alist
			 '("recvmb.+\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/mb;make recvfrommb;make recvfromclt\""))


;; 编译mbcharge
(add-to-list 'smart-compile-alist
			 '("mbcharge\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/mb;make\""))
(add-to-list 'smart-compile-alist
			 '("mbcharge\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/mb;make\""))

(provide 'init-program-compile)
