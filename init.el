;-*-coding: utf-8-*-

;使用Emacs内置的Marmalade，安装扩展包，就像 Ubuntu 的新立得一样可以自动安装软件。 
;;可以用命令 M-x list-packages 来列出软件包清单，选择一个并且安装。
;;如果你知道你所要安装的软件包的名称，也可以直接用命令 M-x package-install [RET] [Package-name] 来安装，这样更加方便。 
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
;; 加载CodeLibrary中的elisp代码片段
(require 'org)
(require 'cl)

(defun level-load (sublevel &optional level-load-path)
  "加载下一层次的配置信息
配置文件被划分为不同层次,不同层次间用-来划分. 例如init-program-lisp.el就是init-program.el的下一层次
因此,在init-program.el中要加载init-program-lisp.el只需要(level-load \"lisp.el\"即可"
  (unless level-load-path
	(setq level-load-path (file-name-directory (or load-file-name default-directory))))
  (add-to-list 'load-path level-load-path)
  (let (level)
	(setq level (file-name-sans-extension (file-name-base  load-file-name)))
	(setq level (concat level "-" sublevel))
	(or
	 (cond ((file-exists-p (expand-file-name (concat level ".org") level-load-path))
			(org-babel-load-file (expand-file-name (concat level ".org") level-load-path) t))
		   ((file-exists-p (expand-file-name (concat sublevel ".org") level-load-path))
			(org-babel-load-file (expand-file-name (concat sublevel ".org") level-load-path) t)))
	 (load level t)
	 (load sublevel t))))

(defun obj-to-symbol (obj)
  "转换为symbol"
  (intern (format "%s" obj)))

(defun package-installable-p (package-name)
  "检查package是否有安装源"
  (require 'package)
  (unless package--initialized
	(package-initialize t))
  (unless package-archive-contents
	(package-refresh-contents))
	(memq (obj-to-symbol package-name) (mapcar #'car package-archive-contents)))

(defun require-and-install (package-name &optional filename noerror)
  ""
  (unless (require package-name filename t)
	(when (and (package-installable-p package-name)
			   (not (package-installed-p package-name)))
	  (package-install (obj-to-symbol package-name))
	  (require package-name filename noerror))))

(defun try-enable-mode (mode-function)
  "若能开启该mode,则开启它"
  (if (functionp mode-function)
	  (progn
		(funcall mode-function 1)
		t)
	nil))

(defun try-disable-mode (mode-function)
  "若能关闭该mode,则关闭它"
  (if (functionp mode-function)
	  (progn
		(funcall mode-function -1)
		t)
	nil))

(defun enable-prefer-mode (&rest mode-functions)
  "从多个类似的mode中选择启用其中一个mode

该函数从前往后遍历mode-functions. 开启存在的第一个mode,其他mode全部关闭"
  (mapcar 'try-disable-mode mode-functions)
  (some 'try-enable-mode mode-functions))

(defun filter-valid-files (&rest files)
  "该函数接收一系列的文件路径,并以列表的形式抽取出其中存在的文件路径"
  (remove-if-not #'file-exists-p files))
(defun filter-valid-file (&rest files)
  "该函数接收一系列的文件路径,并返回第一个存在的文件路径."
  (car (apply #'filter-valid-files files)))

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

;;----------------------------------------------------------------------------
;; Handier way to add modes to auto-mode-alist
;;----------------------------------------------------------------------------
(defun add-auto-mode (mode &rest patterns)
  "Add entries to `auto-mode-alist' to use `MODE' for all given file `PATTERNS'."
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

;;启动server-start模式，当用emacsclientw打开文件时，使用一个缓冲区打开
										;(server-start)
;; 设置显示界面
(level-load "init-display")
;; 设置杂项
(level-load "init-misc")
;; 配置编辑信息
(level-load "init-edit")
;; 时间管理
(level-load "init-GTD")
;;;文件管理
(level-load "init-file-management")
;;;配置shell
(level-load "init-eshell")
;; 编程环境设置
(level-load "init-program")
;;用rlogin来登录ssh
(require 'rlogin)
(setq rlogin-program "plink")
(setq rlogin-process-connection-type t)
;; 娱乐
(level-load "init-life")

;; 设定绑定键
(level-load "init-keybinding")

