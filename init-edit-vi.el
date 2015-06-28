;;自动开启viper-mode
;(setq viper-mode t)
;(setq viper-want-ctl-h-help t)
;(require 'viper)
;启用evil-mode
(require-and-install 'evil)
(evil-mode 1)
(setq evil-want-fine-undo t)

(define-key evil-normal-state-map "gsf" 'switch-current-file)
(define-key evil-normal-state-map "gt" 'semantic-ia-fast-jump-or-back)
(define-key evil-normal-state-map "gpt" 'preview-tag-of-current-word)

;; 默认进入emacs-mode
(setq evil-default-state 'emacs)
;; 下面这些mode进入motion-mode
(dolist (mode '(dired-mode
				diff-mode
                eassist-mode
                gtags-select-mode
				compile-mode
				info-mode
				message-mode
				sx-question-mode
				sx-question-list-mode
                magit-status-mode
                magit-log-mode
                magit-commit-mode
                magit-diff-mode))
  (add-to-list 'evil-motion-state-modes mode))
;; progn-mode与text-mode进入normal-mode
(setq evil-normal-state-modes nil)
(dolist (mode '(prog-mode
				text-mode))
  (add-hook (intern (format "%s-hook" mode)) (lambda()
											   (evil-normal-state 1))))
;; (dolist (mode '(prog-mode
;; 				text-mode
;; 				org-mode))
;;   (add-to-list 'evil-normal-state-modes mode))
