;;配置dired
(level-require "init-file-management-dired")
;; 配置sunrise-commander
(add-to-list 'package-archives '("SC"   . "http://joseito.republika.pl/sunrise-commander/")) ;sunrise-commander的安装源
(package-install-new 'sunrise-commander)
(package-install-new 'sunrise-x-buttons)
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
