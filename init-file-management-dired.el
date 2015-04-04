(require 'dired-x)               ; 有些特殊的功能
(global-set-key "\C-x\C-j" 'dired-jump) ; 通过 C-x C-j 跳转到当前目录的 Dired
(setq dired-guess-shell-alist-user
	  (list
	   (list "\\.pdf$" "Foxit Reader")
	   (list "\\.rm$" "smplayer")
	   (list "\\.rmvb$" "smplayer")
	   (list "\\.avi$" "smplayer")
	   (list "\\.asf$" "smplayer")
	   (list "\\.wmv$" "smplayer")
	   (list "\\.htm$" "iexplore")
	   (list "\\.html$" "iexplore")
	   (list "\\.mpg$" "smplayer")
	   )
	  ) ; 设置一些文件的默认打开方式，此功能必须在(require 'dired-x)之后
(setq
 dired-dwim-target t            ; 若在其他window有一个Dired buffer,则该Dired buffer的目录为Rename/Copy的默认地址
 dired-recursive-copies 'always         ; "always" means no asking
 dired-recursive-deletes 'top           ; "top" means ask once for top level directory
 dired-listing-switches "-lha"          ; human-readable listing
 delete-by-moving-to-trash t			; 删除时放入回收站中 
 dired-x-hands-off-my-keys nil ;使用dired-x-find-file系列命令替代find-file命令,替代后,使用C-u C-x C-f会自动用光标所在的文本作为猜测的文件名
 )

;; 自动刷新Dired-mode
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
(add-hook 'dired-mode-hook 'auto-revert-mode)

;; 隐藏某些文件
(setq dired-omit-files "^\\..*$\\|^\\.$")
(dired-omit-mode 1)
;; if it is not Windows, use the following listing switches
(when (not (eq system-type 'windows-nt))
  (setq dired-listing-switches "-lha --group-directories-first"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GROUP: Files -> Dired -> Wdired    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; wdired allows you to edit a Dired buffer and write changes to disk
;; - Switch to Wdired by C-x C-q
;; - Edit the Dired buffer, i.e. change filenames
;; - Commit by C-c C-c, abort by C-c C-k
(require 'wdired)
(setq
 wdired-allow-to-change-permissions t   ; allow to edit permission bits
 wdired-allow-to-redirect-links     ; allow to edit symlinks
 )



;;; KEY BINDINGS.
;; (define-key ctl-x-map "\C-j" 'dired-jump)
;; (define-key ctl-x-4-map "\C-j" 'dired-jump-other-window))
;; (define-key dired-mode-map "\C-x\M-o" 'dired-omit-mode)
;; (define-key dired-mode-map "*O" 'dired-mark-omitted)
;; (define-key dired-mode-map "\M-(" 'dired-mark-sexp)
;; (define-key dired-mode-map "*(" 'dired-mark-sexp)
;; (define-key dired-mode-map "*." 'dired-mark-extension)
;; (define-key dired-mode-map "\M-!" 'dired-smart-shell-command)
;; (define-key dired-mode-map "\M-G" 'dired-goto-subdir)
;; (define-key dired-mode-map "F" 'dired-do-find-marked-files)
;; (define-key dired-mode-map "Y"  'dired-do-relsymlink)
;; (define-key dired-mode-map "%Y" 'dired-do-relsymlink-regexp)
;; (define-key dired-mode-map "V" 'dired-do-run-mail)
