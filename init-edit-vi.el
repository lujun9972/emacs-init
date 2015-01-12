;;自动开启viper-mode
;(setq viper-mode t)
;(setq viper-want-ctl-h-help t)
;(require 'viper)
;启用evil-mode
(require 'evil)
(evil-mode 1)
(setq evil-want-fine-undo t)

(define-key evil-normal-state-map "gsf" 'switch-current-file)
(define-key evil-normal-state-map "gt" 'semantic-ia-fast-jump-or-back)
(define-key evil-normal-state-map "gpt" 'preview-tag-of-current-word)
;;dired-mode不要进入vi－mode
(dolist (mode '(dired-mode
				diff-mode
                eassist-mode
                gtags-select-mode
				info-mode
                magit-status-mode
                magit-log-mode
                magit-commit-mode
                magit-diff-mode))
  (add-to-list 'evil-emacs-state-modes mode))
