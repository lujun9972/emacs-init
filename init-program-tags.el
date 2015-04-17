;;配置tags
;(global-set-key [\C-f12] (command-execute "ctags -R -e -f etags"))
(defvar project-path-root (pwd))
(add-to-list 'tags-table-list (concat project-path-root "/etags")) ;;设置etag文件的路径
;配置gtags
(setenv "PATH" (concat "D:/bin/global/bin" (getenv "PATH")))
;; (require-and-install 'ggtags)
;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
;;               (ggtags-mode 1))))

;; (define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
;; (define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
;; (define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
;; (define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
;; (define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
;; (define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)
;; (define-key ggtags-mode-map (kbd "C-c g t") 'ggtags-find-tag-dwim)
;; (define-key ggtags-mode-map (kbd "C-c g b") 'pop-tag-mark)

(provide 'init-program-tags)
