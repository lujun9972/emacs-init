;; 新建文件时,自动创建缺失的目录
(defun my-create-non-existent-directory ()
      (let ((parent-directory (file-name-directory buffer-file-name)))
        (when (and (not (file-exists-p parent-directory))
                   (y-or-n-p (format "Directory `%s' does not exist! Create it?" parent-directory)))
          (make-directory parent-directory t))))
(add-to-list 'find-file-not-found-functions #'my-create-non-existent-directory)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; group: Edit                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;设置TAB为4个空格
(setq default-tab-width 4)
;; 设置undo-tree,C-/为undo C-?为redo
(require-and-install 'undo-tree)
(global-undo-tree-mode 1)
;; 设置单词检查
(load "init-edit-spell")
;; 模拟vi
(load "init-edit-vi")
;;显示光标附近的括号匹配
(show-paren-mode 1)
;; 自动插入引号/括号对
(electric-pair-mode 1)
;; 添加pair项
(add-to-list 'electric-pair-pairs '(?` . ?')) ;添加`'作为匹配项
(add-to-list 'electric-pair-pairs '(?` . ?'))
(add-to-list 'electric-pair-pairs '(?[ . ?]))
(add-to-list 'electric-pair-pairs '(?{ . ?}))
;; 设置Coding-System
;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (set-language-environment "UTF-8")
;; (prefer-coding-system 'utf-8)

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
;; (level-load "chinese-pyim")

;; 设置 sentence-end 可以识别中文标点  
(setq sentence-end  
      "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")  
;; 自动判断单个/双个空格表示句子的结束
(defvar sentence-end-double-space-threshold 2
  "How many occurrences of \".  \" per kilobyte should be enough
  to declare this file as using two spaces after sentences.")

(defun set-sentence-end-double-space ()
  "Set `sentence-end-double-space' according to how often the
  literal string \".  \" occurs in the current buffer."
  (make-local-variable 'sentence-end-double-space)
  (if (>= (* (count-matches "\\.  ") 1024)
	  (* (buffer-size) sentence-end-double-space-threshold))
      (setq sentence-end-double-space t)
    (setq sentence-end-double-space nil)))

(add-hook 'find-file-hook 'set-sentence-end-double-space)	
;; (setq sentence-end-double-space nil)  	;单个空格表示句子的结束

;; 支持emacs和外部程序的粘贴 
(setq x-select-enable-clipboard t)  

(provide 'init-edit)
