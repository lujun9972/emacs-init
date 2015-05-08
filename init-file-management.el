;;配置dired
(level-require "init-file-management-dired")
;; 配置sunrise-commander
(level-require "init-file-management-sunrise-commander")
;;使用pdf2txt查看pdf
(add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf2txt)) 
(defun pdf2txt () 
  "Run pdftotext on the entire buffer." 
  (interactive) 
  (let ((modified (buffer-modified-p))) 
	(erase-buffer) 
	(shell-command 
	 (concat "pdftotext " (buffer-file-name) " -") 
	 (current-buffer) 
	 t) 
	(set-buffer-modified-p modified)))

(provide 'init-file-management)
