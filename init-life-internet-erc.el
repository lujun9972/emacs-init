(require 'erc)				;启用ERC
(setq erc-autojoin-channels-alist '(("freenode.net" "#ubuntu-cn"))) ;设置自动登录的频道
(setq erc-interpret-mirc-color t)	;支持mIRC风格的颜色命令
(setq erc-kill-buffer-on-part t)	;/part频道之后自动关闭buffer
(setq erc-kill-queries-on-quit t)	;离开server之后,自动关闭私密查询buffer
(setq erc-kill-server-buffer-on-quit t)	;离开server之后,关闭server消息buffer
;;(add-to-list 'erc-modules 'bbdb)	;与bbdb整合
(add-to-list 'erc-modules 'identd)	;启动identd服务
(add-to-list 'erc-modules 'smiley)	;将笑脸符号转换为图标
(erc-update-modules)
(setq erc-nick "lujun9972")		;设置昵称
(setq erc-user-full-name "lujunwei")	;设置全称
;; (setq erc-port 6667)			;设置port
;; (seq erc-server "irc.freenode.com")	;设置服务器
