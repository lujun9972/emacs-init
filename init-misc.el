;;开启hl-line模式
;; (global-hl-line-mode 1)
;; 让 Emacs 可以直接打开和显示图片。
(auto-image-file-mode)
;;开启fileset功能
;; (filesets-init)
;;使用目录名来区分同名buffer
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")
;;开启winner-mode,可以undo /redo 对windows的操作 C-c <- 或 C-c ->
(winner-mode 1)
;;开启windmove,使用shift-方向键切换window
(windmove-default-keybindings 'shift)
;; 使用switch-window插件,使得C-x o在多个window时提示你要跳转到哪个window
(require-and-install 'switch-window)
(setq switch-window-shortcut-style 'alphabet)
(global-set-key (kbd "C-x o") 'switch-window)
;; 透明处理压缩文件
(auto-compression-mode 1)
;; 启用tabbar
;; (require-and-install 'tabbar)
;; (tabbar-mode t)
;; (defvar tabbar-buffer-name-group-alist
;;   '(("*tramp.+*" "hidden"))
;;   "根据名称的正则表达式来为tabbar提供分组信息

;; 每个原始的car为buffer-name匹配的正则表达式, cdr为分组list")
;; (defun my-tabbar-buffer-groups ()
;;   "tabbar分组函数

;; 先根据`tabbar-buffer-name-group-alist'与buffer-name查找匹配的分组,否则使用`tabbar-buffer-groups'进行分组"
;;   (let ((match-rule (find-if (lambda (match-rule)
;; 							   (string-match-p (car match-rule) (buffer-name))) tabbar-buffer-name-group-alist)))
;; 	(if match-rule
;; 		(cdr match-rule)
;; 	  (tabbar-buffer-groups))))
;; (setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)
;;设置tramp
(level-require "tramp")
;; 设置ido和smex
(level-require "ido")
(level-require "smex")
;; 保存session
(level-require "session")
;; 配置keyfreq用来记录按键频率,使用keyfre-show查看
(level-require "keyfreq")
;; clean-buffers
(require-and-install 'clean-buffers)
;; (run-with-idle-timer 5 t #'kill-useless-buffers) ;自动清理超过无用的buffer
(clean-buffers-turn-on-auto-clean-buffers) ;自动清理超过无用的buffer
;; sr-speedbar
(level-load "sr-speedbar")
;; 配置ediff
(setq ediff-diff-options "-w"
      ediff-split-window-function 'split-window-horizontally
      ediff-window-setup-function 'ediff-setup-windows-plain)

;; 配置info+
;; Info+ helps you read Info documents more enjoyable with extra highlighting it provides
(require-and-install 'info+)
(defun set-info-keys()
  ""
  (interactive)
  (local-set-key (kbd "<mouse-4>") 'mwheel-scroll )
  (local-set-key (kbd "<mouse-5>") 'mwheel-scroll ) )
;; discover-my-major
;; Discover key bindings and their meaning for the current Emacs major mode. 
(require-and-install 'discover-my-major)
(global-unset-key (kbd "C-h h"))        ; 默认C-h h显示各种语言的hello world
(define-key 'help-command (kbd "h m") 'discover-my-major)

;; 使用discover可以为其他package增加context-menu,以方便使用
;; 使用discover-add-context-menu函数可以为第三方的package增加context-menu
;; 默认,discover-mode已经为dired-mode增加了context-menu,绑定到?上了
;; Useful Helper Commands:
;; You can get the name of the command that reveals a given context menu by calling discover-get-context-menu-command-name. If you just want to funcall the returned symbol, the function discover-show-context-menu will do this for you.
(require-and-install 'discover)
(global-discover-mode 1)

;; 使用C-h C-f查看函数的源代码
(defun find-function-view-mode (fun)
  (interactive (find-function-read))
  (find-function-do-it fun nil 'switch-to-buffer)
  (view-mode 1))

(global-set-key (kbd "C-h C-f") 'find-function-view-mode)
(level-require "ibuffer")
;; 使用deft管理笔记
(level-require "deft")
;; 使用dict/dictd翻译英文
(level-require "dict")

;; showkey可以显示操作的按键及运行的函数
(package-install-new 'showkey)
;; 为防止不小心按到C-c C-x,在退出Emacs前需要确认
(setq confirm-kill-emacs (lambda (prompt) (y-or-n-p-with-timeout "是否退出Emacs:(" 10 "y")))
;; start-menu运行外部程序
(require-and-install 'start-menu)
(start-menu-enable)
;; dmenu运行外部程序
(require-and-install 'dmenu)

(provide 'init-misc)
