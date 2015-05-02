;;设置w3m
(level-require "init-life-internet-w3m")
;; 设置eww
(level-require "init-life-internet-eww")
;;设置newsticker,阅读RSS
(level-require "init-life-internet-newsticker")
;;配置ERC
(level-require "init-life-internet-erc")
;; goto-address-mode允许你在buffer中高亮并点击URL
(add-hook 'prog-mode-hook 'goto-address-mode)
(add-hook 'text-mode-hook 'goto-address-mode)
;;默认链接网络浏览器打开  
(setq browse-url-generic-program (executable-find "firefox")  
     browse-url-browser-function 'w3m-browse-url)  
;; 配置org2blog写博客
(level-require "init-life-internet-org2blog")
;; 配置weibo上微薄
(level-require "init-life-internet-weibo")
;; 配置Stack Exchange for Emacs
(level-require "init-life-internet-sx")
(provide 'init-life-internet)
