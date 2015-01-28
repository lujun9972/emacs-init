;;快捷键
;; (org-remember-insinuate)
(global-set-key "\C-cr" 'org-remember)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
;; org-capture配置
(setq org-default-notes-file (concat GTD-HOME-PATH "Inbox.org"))
(setq org-capture-templates
	  '(("t" "TODO" entry (file+headline (concat GTD-HOME-PATH "home.org" ) "Tasks") "** TODO %? %^g Added at %U") 
		("i" "Idea" entry (file+headline (concat GTD-HOME-PATH "home.org" ) "Ideas") "** %? %x %a") 
		("o" "other" entry (file+headline (concat GTD-HOME-PATH "home.org" ) "Inbox") "** %? %x %a %f " ) 
		("n" "Note" entry (file+headline (concat GTD-HOME-PATH "Note.org" ) "Notes") "* %? %x %^g") 
		("b" "Books" entry (file+headline (concat GTD-HOME-PATH "home.org" ) "Books") "** TODO %^{书籍名称？}  :book:")))
;; 配置agenda view
(setq org-agenda-files (list (concat GTD-HOME-PATH "home.org")
			     (concat GTD-HOME-PATH "office.org")
			     (concat GTD-HOME-PATH "Note.org")))
(setq org-agenda-include-diary t)		;将diary的事项也纳入agenda中显示

;; 新增org文件时插入模版
(defun new-org-file-init ()
  "init new org file template"
  (interactive)
  (when (equal "org" (file-name-extension buffer-file-name))
	  (insert (concat "#+TITLE: "(file-name-base buffer-file-name)) "\n")
	  (insert "#+AUTHOR: " user-login-name "\n")
	  (insert "#+OPTIONS: ^:{}")))
(add-to-list 'find-file-not-found-hooks 'new-org-file-init)

;; 设置org笔记时的缩进
(setq org-description-max-ident 5)

;; 设置org template
(add-to-list 'org-structure-template-alist '("se" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC" "<src lang=\"emacs-lisp\">\n?\n</src>"))

;; 高亮显示code blocks
(setq org-src-fontify-natively t)

;; 设置为org文件添加attachment的方法
(require 'org-attach)
(defun org-insert-attachment-link (&optional attachment-file-name)
  " Org file中便捷创建指向attachment目录中文件的链接"
  (interactive)
  (let (attachment-directory attachment-file-path)
	(setq attachment-directory (org-attach-expand ""))
	(if (null attachment-file-name)
		(setq attachment-file-path (read-file-name "请输入附件名称: " attachment-directory))
	  (setq attachment-file-path (concat (file-name-as-directory attachment-directory)  attachment-file-name))
	  )
	(org-insert-link nil (concat "./" (file-relative-name attachment-file-path)) nil)
	(newline)))

(defun org-add-attachment-and-link (&optional attachment-file-path)
  " Org file中添加附件,并增加指向附件的链接"
  (interactive)
  (let (attachment-file-name)
	(unless attachment-file-path
	  (setq attachment-file-path (read-file-name "请输入要添加为附件的文件路径")))
	(setq attachment-file-name (file-name-nondirectory attachment-file-path))
	(org-attach-attach attachment-file-path nil 'cp)
	(org-insert-attachment-link attachment-file-name)))

(defun org-add-attachment-and-link-drag-n-drop-event (event)
  "用darg-and-drop的方式,为Org file添加附件,并增加指向附件的链接"
  (interactive "e")
  (let ((files (nth 2 event)))
		(message "add %s..." files)
		(cond ((listp files)
			   (mapcar 'org-add-attachment-and-link files))
			  (t (error "未知的文件列表格式")))))


(defun org-add-attachment-and-link-by-drag-n-drop ()
  "用darg-and-drop的方式,为Org file添加附件,并增加指向附件的链接"
  (interactive)
  (let (old-drag-n-drop-event-handler)
	(setq old-drag-n-drop-event-handler (lookup-key special-event-map [drag-n-drop]))
	(unwind-protect (progn
					  (define-key special-event-map [drag-n-drop] 'org-add-attachment-and-link-drag-n-drop-event)
					  (message "可以开始拖拽要添加非附件的文件了,完成后按回车")
					  (read-char))
	  (define-key special-event-map [drag-n-drop] old-drag-n-drop-event-handler))))

(define-key special-event-map [drag-n-drop] 'x-dnd-handle-drag-n-drop-event)
