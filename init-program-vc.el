;; 配置magit
(sudo-apt-get-install "git")
(add-to-list 'load-path "D:/program files/emacs-24.3/site-lisp/git-modes")
(add-to-list 'load-path "D:/program files/emacs-24.3/site-lisp/magit")
(require-and-install 'magit)
(setq magit-auto-revert-mode nil)
(setq magit-last-seen-setup-instructions "1.4.0")

(provide 'init-program-vc)
