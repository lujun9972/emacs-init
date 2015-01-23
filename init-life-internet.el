;;设置w3m
(load "init-life-internet-w3m")
;; 设置eww
(load "init-life-internet-eww")
;;设置newsticker,阅读RSS
(load "init-life-internet-newsticker")
;;配置ERC
(load "init-life-internet-erc")
;; goto-address-mode允许你在buffer中高亮并点击URL
(add-hook 'prog-mode-hook 'goto-address-mode)
(add-hook 'text-mode-hook 'goto-address-mode)
;;默认链接网络浏览器打开  
(setq browse-url-generic-program (executable-find "firefox")  
     browse-url-browser-function 'w3m-browse-url)  
