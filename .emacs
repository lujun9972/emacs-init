(defvar init-files nil
  "可选的初始化文件列表")
(dolist (init-file '("~/emacs-init/init.el"
					 "/mnt/d/spacemacs/init.el"
					 "d:/spacemacs/init.el"))
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
;; (shell-command (format "ln -s %s ~/.emacs.d" (file-name-directory init-file)))
(load init-file)
