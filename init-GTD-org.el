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

(require 'darksun-org-helper)
