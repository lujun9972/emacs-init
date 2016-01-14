;; 对buffer当前文件的一些处理
(defun delete-this-file ()
  "Delete the current file, and kill the buffer."
  (interactive)
  (or (buffer-file-name) (error "No file is currently being edited"))
  (when (yes-or-no-p (format "Really delete '%s'?"
                             (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)))

(defun rename-this-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (if (get-buffer new-name)
        (message "A buffer named '%s' already exists!" new-name)
      (progn
        (when (file-exists-p filename)
         (rename-file filename new-name 1))
        (rename-buffer new-name)
        (set-visited-file-name new-name)))))

(defun browse-current-file ()
  "Open the current file as a URL using `browse-url'."
  (interactive)
  (let ((file-name (buffer-file-name)))
    (if (tramp-tramp-file-p file-name)
        (error "Cannot open tramp file")
      (browse-url (concat "file://" file-name)))))

;;配置dired
(level-require "init-file-management-dired")
;; 配置sunrise-commander
;; (level-require "init-file-management-sunrise-commander")
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
