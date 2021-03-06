;-*-coding: utf-8-*-
(require 'org)
(require 'cl)
(defun filter-valid-files (&rest files)
  "该函数接收一系列的文件路径,并以列表的形式抽取出其中存在的文件路径"
  (remove-if-not #'file-exists-p files))
(defun filter-valid-file (&rest files)
  "该函数接收一系列的文件路径,并返回第一个存在的文件路径."
  (car (apply #'filter-valid-files files)))
;使用Emacs内置的Marmalade，安装扩展包，就像 Ubuntu 的新立得一样可以自动安装软件。
;;可以用命令 M-x list-packages 来列出软件包清单，选择一个并且安装。
;;如果你知道你所要安装的软件包的名称，也可以直接用命令 M-x package-install [RET] [Package-name] 来安装，这样更加方便。
(require 'package)
;; (add-to-list 'package-archives
;; 	'("marmalade" .
;; 	  "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-initialize)

;; 定义几个常用目录的路径
(defconst MY-LISP-PATH (filter-valid-file "~/MyLisp" "e:/MyLisp" "d:/MyLisp"))
(defconst CODE-LIBRARY-PATH (filter-valid-file "~/CodeLibrary/elisp.org" "d:/CodeLibrary/elisp.org"  "e:/CodeLibrary/elisp.org"))
(defconst MY-GTD-PATH (filter-valid-file "~/我的GTD" "e:/我的GTD" "d:/我的GTD"))
(defconst MY-NOTE-PATH (filter-valid-file "~/我的笔记" "e:/我的笔记" "d:/我的笔记"))

(defun obj-to-symbol (obj)
  "转换为symbol"
  (unless (stringp obj)
	(setq obj (prin1-to-string obj t)))
  (intern obj))
;; 加载相关辅助函数
(add-to-list 'load-path MY-LISP-PATH)
(dolist (helper-package (directory-files MY-LISP-PATH nil "helper\.el"))
  (require (obj-to-symbol (file-name-base helper-package))))


(defun get-load-or-default-directory()
  (file-name-directory (or load-file-name default-directory)))

;; 加载CodeLibrary中的elisp代码片段
(org-babel-load-file CODE-LIBRARY-PATH)
(add-to-list 'load-path "~/org-mode/contrib/lisp")
(defun org-babel-tangle-newer-file (FILE &optional TARGET-FILE LANG)
  "tangle only if the file is newer than the target-file"
  (let ((age (lambda (file)
			   (float-time
				(time-subtract (current-time)
							   (nth 5 (or (file-attributes (file-truename file))
										  (file-attributes file))))))))
	(unless (and TARGET-FILE
				 (file-exists-p TARGET-FILE)
				 (> (funcall age FILE) (funcall age TARGET-FILE)))
	  (setq TARGET-FILE
			(car (org-babel-tangle-file FILE TARGET-FILE LANG))))
	TARGET-FILE))

(defun org-babel-tangle-newer-elisp-file (FILE)
  "tangle only if the org-mode file is newer than the elisp-file"
  (let ((TARGET-FILE (concat (file-name-sans-extension FILE) ".el"))
		(LANG "emacs-lisp"))
	(org-babel-tangle-newer-file FILE TARGET-FILE LANG)))

(defun level-require (sublevel &optional level-load-path)
  "加载下一层次的配置信息
配置文件被划分为不同层次,不同层次间用-来划分. 例如init-program-lisp.el就是init-program.el的下一层次
因此,在init-program.el中要加载init-program-lisp.el只需要(level-load \"lisp.el\"即可"
  (message "enter level-require %s" sublevel)
  (unless level-load-path
	(setq level-load-path (get-load-or-default-directory)))
  (add-to-list 'load-path level-load-path)
  (let (level)
	(setq level (file-name-sans-extension (file-name-base  (or load-file-name
															   (buffer-file-name)
															   "~/emacs-init/init.el"))))
	(setq level (concat level "-" sublevel))
	(cond ((file-exists-p (expand-file-name (concat level ".org") level-load-path))
		   (org-babel-tangle-newer-elisp-file (expand-file-name (concat level ".org") level-load-path)))
		  ((file-exists-p (expand-file-name (concat sublevel ".org") level-load-path))
		   (org-babel-tangle-newer-elisp-file (expand-file-name (concat sublevel ".org") level-load-path))))
	(or
	 (require (obj-to-symbol level)nil t)
	 (require (obj-to-symbol sublevel) nil t)))
  (message "leave level-require %s" sublevel))


(defun level-load (sublevel &optional level-load-path)
  "加载下一层次的配置信息
配置文件被划分为不同层次,不同层次间用-来划分. 例如init-program-lisp.el就是init-program.el的下一层次
因此,在init-program.el中要加载init-program-lisp.el只需要(level-load \"lisp.el\"即可"
  (message "enter level-load %s" sublevel)
  (unless level-load-path
	(setq level-load-path (get-load-or-default-directory)))
  (add-to-list 'load-path level-load-path)
  (let (level)
	(setq level (file-name-sans-extension (file-name-base  (or load-file-name
															   (buffer-file-name)
															   "~/emacs-init/init.el"))))
	(setq level (concat level "-" sublevel))
	(or
	 (cond ((file-exists-p (expand-file-name (concat level ".org") level-load-path))
			(org-babel-load-file (expand-file-name (concat level ".org") level-load-path) t))
		   ((file-exists-p (expand-file-name (concat sublevel ".org") level-load-path))
			(org-babel-load-file (expand-file-name (concat sublevel ".org") level-load-path) t)))
	 (load level t)
	 (load sublevel t)))
  (message "leave level-load %s" sublevel))

(defun sudo-apt-get-install(soft)
  "run sudo apt-get install `soft` if found no soft"
  (when (and (not (executable-find soft))
			 (executable-find "sudo")
			 (executable-find "apt-get"))
	(require 'eshell)
	(eshell-command (format "sudo apt-get -y install %s" soft))))

(pcase system-type
  (`windows-nt (level-load "init-windows")) ; 配置windows下使用emacs
  (`cygwin (level-load "init-cygwin")) ; 配置cygwin
  (`gnu/linux (level-load "init-linux")))

;; 管理使用url下载的插件
(level-require "init-site-lisp")
;; 评测加载各插件的速度
(level-require "init-benchmarking");
;;启动server-start模式，当用emacsclientw打开文件时，使用一个缓冲区打开
(require 'server)
(unless (server-running-p)
  (server-start))
;; 设置显示界面
(level-require "init-display")
;; 设置杂项
(level-require "init-misc")
;; 配置编辑信息
(level-require "init-edit")
;; 时间管理
(level-require "init-GTD")
;;;文件管理
(level-require "init-file-management")
;;;配置shell
(level-require "init-eshell")
;; 编程环境设置
(level-require "init-program")
;;用rlogin来登录ssh
(require 'rlogin)
(setq rlogin-program "plink")
(setq rlogin-process-connection-type t)
;; 娱乐
(level-require "init-life")

;; 设定绑定键
(level-require "init-keybinding")
