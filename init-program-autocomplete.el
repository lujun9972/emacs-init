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
;; 禁用自动补全
;; (setq ac-auto-start nil)
;; 设定一个触发按键
(ac-set-trigger-key "TAB")
;;设定一个指定的数字，只有连续输入了指定数目的字符以后才会开始自动补全。 
(setq ac-auto-start 2)
;; 翻看了一下auto-complete的文档，发现其中核心的函数 auto-complete 是支 持参数的：
;; (auto-complete &optional SOURCES)
;; 其中 SOURCES 是一个complete source列表，如果没有指定此参数， auto-complete 会使用buffer局部的 ac-sources 变量。
