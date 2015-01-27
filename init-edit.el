;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; group: Edit                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;设置TAB为4个空格
(setq default-tab-width 4)
;; 设置undo-tree,C-/为undo C-?为redo
(require 'undo-tree)
(global-undo-tree-mode 1)
;; 设置单词检查
(load "init-edit-spell")
;; 模拟vi
(load "init-edit-vi")
;; 自动插入引号/括号对
(electric-pair-mode 1)
;; 设置Coding-System
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(delete-selection-mode 1)
(global-set-key (kbd "RET") 'newline-and-indent)

;; GROUP: Convenience -> Hippe Expand
;; hippie-expand is a better version of dabbrev-expand.
;; While dabbrev-expand searches for words you already types, in current;; buffers and other buffers, hippie-expand includes more sources,
;; such as filenames, klll ring...
(global-set-key (kbd "M-/") 'hippie-expand) ;; replace dabbrev-expand
(setq
 hippie-expand-try-functions-list
 '(try-expand-dabbrev ;; Try to expand word "dynamically", searching the current buffer.
   try-expand-dabbrev-all-buffers ;; Try to expand word "dynamically", searching all other buffers.
   try-expand-dabbrev-from-kill ;; Try to expand word "dynamically", searching the kill ring.
   try-complete-file-name-partially ;; Try to complete text as a file name, as many characters as unique.
   try-complete-file-name ;; Try to complete text as a file name.
   try-expand-all-abbrevs ;; Try to expand word before point according to all abbrev tables.
   try-expand-list ;; Try to complete the current line to an entire line in the buffer.
   try-expand-line ;; Try to complete the current line to an entire line in the buffer.
   try-complete-lisp-symbol-partially ;; Try to complete as an Emacs Lisp symbol, as many characters as unique.
   try-complete-lisp-symbol) ;; Try to complete word as an Emacs Lisp symbol.
 )

(setq large-file-warning-threshold 100000000) ;; 打开超过这么多字节的文件时才显示警告

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GROUP: Edit -> Back up             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar backup-directory "~/.backups")
(if (eq system-type 'windows-nt)
	(setq backup-directory "d:/backups")
  (setq backup-directory "~/.backups"))

(if (not (file-exists-p backup-directory))
    (make-directory backup-directory t))
(setq
 make-backup-files t        ; backup a file the first time it is saved
 backup-directory-alist `((".*" . ,backup-directory)) ; save backup files in ~/.backups
 backup-by-copying t     ; copy the current file into backup directory
 version-control t   ; version numbers for backup files
 delete-old-versions t   ; delete unnecessary versions
 kept-old-versions 6     ; oldest versions to keep when a new numbered backup is made (default: 2)
 kept-new-versions 9 ; newest versions to keep when a new numbered backup is made (default: 2)
 auto-save-default t ; auto-save every buffer that visits a file
 auto-save-timeout 20 ; number of seconds idle time before auto-save (default: 30)
 auto-save-interval 200 ; number of keystrokes between auto-saves (default: 300)
 )


;; 设置pyim输入法
(level-load "chinese-pyim")

;; 设置 sentence-end 可以识别中文标点  
(setq sentence-end  
      "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")  
(setq sentence-end-double-space nil)  	;单个空格表示句子的结束

;; 支持emacs和外部程序的粘贴 
(setq x-select-enable-clipboard t)  
