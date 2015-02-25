;;配置auto-complete
(require-and-install 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)
(setq ac-use-quick-help t)
(setq ac-quick-help-delay 1.0)
;; 这里将backspace的删除后仍旧可以触发ac补全,
;; 只要将对应的功能的函数名称加入ac-trigger-commands列表就可以
(setq ac-trigger-commands
      (cons 'backward-delete-char-untabify ac-trigger-commands))
