;-*-coding: utf-8-*-

;使用Emacs内置的Marmalade，安装扩展包，就像 Ubuntu 的新立得一样可以自动安装软件。 
;;可以用命令 M-x list-packages 来列出软件包清单，选择一个并且安装。
;;如果你知道你所要安装的软件包的名称，也可以直接用命令 M-x package-install [RET] [Package-name] 来安装，这样更加方便。 
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)
;; 加载CodeLibrary中的elisp代码片段
(require 'org)


(defun level-load (sublevel &optional level-load-path)
  "加载下一层次的配置信息
配置文件被划分为不同层次,不同层次间用-来划分. 例如init-program-lisp.el就是init-program.el的下一层次
因此,在init-program.el中要加载init-program-lisp.el只需要(level-load \"lisp.el\"即可"
  (unless level-load-path
	(setq level-load-path (file-name-directory load-file-name)))
  (add-to-list 'load-path level-load-path)
  (let (level)
	(setq level (file-name-sans-extension (file-name-base  load-file-name)))
	(setq level (concat level "-" sublevel))
	(or (load level t)
		(load sublevel t)
		(cond (file-exists-p (expand-file-name (concat level ".org") level-load-path)
				     (org-babel-load-file (expand-file-name (concat level ".org") level-load-path) t))
		      (file-exists-p (expand-file-name (concat sublevel ".org") level-load-path)
				     (org-babel-load-file (expand-file-name (concat sublevel ".org") level-load-path) t))))))
(pcase system-type
  (`windows-nt (level-load "init-windows")) ; 配置windows下使用emacs
  (`gnu/linux (level-load "init-linux")))

;;;快捷键
(level-load "init-bindings")
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
;编程环境设置
(level-load "init-program")
;;用rlogin来登录ssh
(require 'rlogin)
(setq rlogin-program "plink")
(setq rlogin-process-connection-type t)
;娱乐
(level-load "init-life")

