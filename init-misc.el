;;开启hl-line模式
(global-hl-line-mode 1)
;; 让 Emacs 可以直接打开和显示图片。
(auto-image-file-mode)
;;开启fileset功能
;; (filesets-init)
;;使用目录名来区分同名buffer
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
;;开启winner-mode,可以undo /redo 对windows的操作 C-c <- 或 C-c ->
(winner-mode 1)
;;开启windmove,使用shift-方向键切换window
(windmove-default-keybindings 'shift)
;; 透明处理压缩文件
(auto-compression-mode 1)
;启用tabbar
(require-and-install 'tabbar)
(tabbar-mode t)
;;设置tramp
(level-load "tramp")
;; 设置ido和recentf
(level-load "ido")
;; 保存session
(level-load "session")
;; 配置keyfreq用来记录按键频率,使用keyfre-show查看
(level-load "keyfreq")
;; clean-buffers
(require 'darksun-clean-buffers)
;; (run-with-idle-timer 5 t #'kill-useless-buffers) ;自动清理超过无用的buffer
(run-with-timer 0 5 #'kill-useless-buffers) ;自动清理超过无用的buffer
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

(global-set-key (kbd "C-x C-b") 'ibuffer)
;; 配置golden-ratio
;; (level-load "golden-ratio")
;; 使用deft管理笔记
(level-load "deft")
;; 使用dict/dictd翻译英文
(level-load "dict")
