(defvar init-files-alist '(("~/emacs-init/init.el" . nil)
						   ("/mnt/d/spacemacs/init.el" . t)
						   ("d:/spacemacs/init.el" . t))
  "元素的car为初始化文件的路径,cdr为是否更改`user-emacs-directory'的值")

(defvar init-files nil
  "可选的初始化文件列表")
(dolist (init-file (mapcar #'car init-files-alist))
  (when (file-exists-p init-file)
	(add-to-list 'init-files init-file t)))

(defun gen-select-init-files-prompt (init-files)
  (let (select-init-files-prompt)
	(dotimes (id (length init-files) select-init-files-prompt)
	  (push (format "%s : %s" id (nth id init-files)) select-init-files-prompt))
	(concat (mapconcat 'identity (nreverse select-init-files-prompt) "\n") "\n请选择初始化文件: ")))

(defcustom init-file-timeout 5
  "选择初始化文件的超时时间")
(defvar init-file (cond ((= 1 (length init-files))
						 (car init-files))
						(t (nth (with-timeout (init-file-timeout 0)
								  (read-number (gen-select-init-files-prompt init-files))) init-files)))
  
  "加载的初始化文件")
(when (cdr (assoc init-file init-files-alist))
  (setq user-emacs-directory (file-name-directory init-file)))
(load init-file)
