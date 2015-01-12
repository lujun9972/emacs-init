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
