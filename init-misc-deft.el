(require-and-install 'deft)
(setq deft-extension "org")                             ;设置默认搜索org文件
(setq deft-directory MY-NOTE-PATH)              ;设置搜索路径
(setq deft-text-mode 'org-mode)                 ;编辑时，默认使用org-mode
(setq deft-use-filename-as-title t)             ;使用文件名为标题

(provide 'init-misc-deft)
