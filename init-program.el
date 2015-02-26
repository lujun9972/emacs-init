;; 只在编程模式下显示行号
(add-hook 'prog-mode-hook 'linum-mode) 
;; 在编程模式下显示无用的whitespace
;; (add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))
;;显示光标附近的括号匹配
(show-paren-mode 1)
;; 添加pair项
(add-to-list 'electric-pair-pairs '(?` . ?')) ;添加`'作为匹配项
(add-to-list 'electric-pair-pairs '(?` . ?'))
(add-to-list 'electric-pair-pairs '(?[ . ?]))
(add-to-list 'electric-pair-pairs '(?{ . ?}))
;; (add-to-list 'electric-pair-pairs '(?< . ?>))
;; 控制缩进
(load "init-program-indent")
;; imenu配置
(load "init-program-imenu")
;; 配置版本控制
(load "init-program-vc")
(require 'darksun-cpp-helper)
;; 配置dos模式,编写批处理文件
(load "init-program-dos")
;;配置auto-complete
(require-and-install 'popup)
(level-load "init-program-autocomplete")
;; 配置company
;; (level-load "company")
;; 配置TAGS处理
(load "init-program-tags")
;;配置markdown-mode
(load "init-program-markdown")
;; 配置各种lisp编程
(load "init-program-lisp")
;; 配置lua编程
(load "init-program-lua")
;; 配置cpp编程
(load "init-program-cpp")
;; 配置cedet
(load "init-program-cedet")
;; 配置SQL
(load "init-program-sql")
;; 配置compile
(load "init-program-compile")
;; 配置projectile
(level-load "projectile")
;; 配置yasnippet
(level-load "yasnippet")
;; 配置GDB
(level-load "gdb")

;; 配置makefile
(level-load "makefile")
