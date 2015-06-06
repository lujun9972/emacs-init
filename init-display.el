;;关闭开始屏幕
(setq inhibit-startup-message t)
;;关闭开始屏幕
(setq inhibit-startup-message t)
;; you won't need any of the bar thingies
;; turn it off to save screen estate
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;; the blinking cursor is nothing, but an annoyance
(blink-cursor-mode -1)

(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position nil)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
;; taken from prelude-ui.el
(setq frame-title-format
      '("" invocation-name " - " (:eval (if (buffer-file-name)
											(abbreviate-file-name (buffer-file-name))
										  "%b"))))

;;显示列号
(column-number-mode 1)
;;显示buffer size
(size-indication-mode 1)
;; Ctrl+鼠标滚轮，改变字体大小
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
;; 设置nyan-mode,该mode会在modeline上显示一直小猫用来指示光标所在文章的位置的
;; (level-require "nyan")
;; fullframe可以在一个fullframe中执行某些命令,并在显示之前前保存window-configuration,当命令完成后,会还原该window-configuration
(require-and-install 'fullframe)
(fullframe list-packages quit-window)	;执行list-packages命令会全屏显示,执行quit-window后会自动还原原window配置信息.
(fullframe magit-status magit-mode-quit-window nil)

(provide 'init-display)
