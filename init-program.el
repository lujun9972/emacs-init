;; 只在编程模式下显示行号
(add-hook 'prog-mode-hook 'linum-mode) 
;; 在编程模式下启用折叠特性
(add-hook 'prog-mode-hook 'hs-minor-mode) 
;; 在编程模式下显示无用的whitespace
;; (add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))
;; 关于括号
;; (require-and-install 'paredit)
;; 控制缩进
(level-require "init-program-indent")
;; imenu配置
(level-require "init-program-imenu")
;; 配置版本控制
(level-require "init-program-vc")
;;配置auto-complete
(require-and-install 'popup)
(level-require "init-program-autocomplete")
;; 配置company
;; (level-require "company")
;; 使用zeal查看docset
(level-require "init-program-zeal")
;; 配置TAGS处理
(level-require "init-program-tags")
;;配置markdown-mode
(package-install-new 'markdown-mode)
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(level-require "init-program-markdown")
;; 配置lisp编程
;; 开启eldoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)

;; redshank用于重构
(require-and-install 'paredit)			;redshank依赖paredit
(require-and-install 'redshank)
(add-hook 'emacs-lisp-mode-hook 'turn-on-redshank-mode)
(add-hook 'ielm-mode-hook 'turn-on-redshank-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-redshank-mode)
(level-require "init-program-lisp")
;; 配置lua编程
(package-install-new 'lua-mode)
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode)) 
(level-require "init-program-lua")
;; 配置cpp编程
(add-to-list 'auto-mode-alist '("\\.Sqc\\'" . c++-mode))
(add-hook 'c-mode-hook
		  (lambda ()
			(level-require "init-program-cpp")))
(add-hook 'c++-mode-hook
		  (lambda ()
			(level-require "init-program-cpp")))
(require 'cpp-helper)
;; 配置dos模式,编写批处理文件
(package-install-new 'dos)
(autoload 'dos-mode "dos" "Bat editing mode." t)
(add-to-list 'auto-mode-alist '("\\.bat\\'" . dos-mode))
(add-hook 'dos-mode-hook
		  (lambda ()
			(level-require "init-program-dos")))
;; 配置ruby编程
(autoload 'ruby-mode "ruby-mode" "ruby editing mode." t)
(add-auto-mode 'ruby-mode
               "Rakefile\\'" "\\.rake\\'" "\\.rxml\\'"
               "\\.rjs\\'" "\\.irbrc\\'" "\\.pryrc\\'" "\\.builder\\'" "\\.ru\\'"
               "\\.gemspec\\'" "Gemfile\\'" "Kirkfile\\'")
(add-hook 'ruby-mode-hook
		  (lambda ()
			(level-require "init-program-ruby")))
;; 配置cedet
(level-require "init-program-cedet")
;; 配置SQL
(level-require "init-program-sql")
;; 配置compile
(level-require "init-program-compile")
;; 配置projectile
(level-require "projectile")
;; 配置yasnippet
(level-require "yasnippet")
;; 配置GDB
(level-require "gdb")

;; 配置makefile
(level-require "makefile")

;; 保存时,检查文件是否包含#!,若包含则给文件添加执行权限
(defun mark-executable-when-save ()
  (add-hook 'after-save-hook
			'executable-make-buffer-file-executable-if-script-p nil t))
(add-hook 'prog-mode-hook #'mark-executable-when-save)

;; gist for emacs
(level-require "gist")
(setq-default grep-scroll-output t)		;随着grep输出结果的增多,buffer自动滚动
;; diff-hl高亮显示未提交的代码
(package-install-new 'diff-hl)
(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)

(provide 'init-program)
