(setq eww-download-directory "d:/Download") ;下载目录
(setq eww-search-prefix "http://www.baidu.com/baidu?wd=") ;使用baidu进行搜索
(require 'eww-auto-reload)								  ;当eww访问的url是file url时,提供类似auto-revert的功能.

(provide 'init-life-internet-eww)
