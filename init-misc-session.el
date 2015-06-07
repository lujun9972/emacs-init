;;自动保存session
(require 'desktop)
(setq desktop-path '("."))
;; 为每个不同的系统定义不同的保存名称,这是为了使得同一台机器上不同环境间互补干扰
(setq desktop-base-file-name (file-name-nondirectory (format "%s.emacs.desktop" system-type)))
(setq desktop-auto-save-timeout 600)	;10分钟保存一次
(desktop-save-mode 1)
(toggle-save-place-globally 1)			;保存各buffer的光标位置
(savehist-mode t)						;保存minibuffer的history

(provide 'init-misc-session)
