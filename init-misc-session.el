;;自动保存session
(require 'desktop)
(setq desktop-path '("."))
(desktop-save-mode 1)
(toggle-save-place-globally 1)			;保存各buffer的光标位置
