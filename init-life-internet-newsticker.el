(require 'newsticker)
(add-hook 'newsticker-mode-hook 'imenu-add-menubar-index) 
(add-to-list 'newsticker-url-list '("planet emacs" "http://planet.emacsen.org/atom.xml" nil nil nil)) ;添加planet emacs的RSS
;(add-to-list 'newsticker-url-list '("陈斌的博客" "http://blog.binchen.org/?feed=rss2" nil nil nil)) ;添加planet emacs的RSS
(add-to-list 'newsticker-url-list '("Emacs Redux" "http://emacsredux.com/atom.xml" nil nil nil))
(add-to-list 'newsticker-url-list '("lunaryorn" "http://www.lunaryorn.com/feed.atom" nil nil nil))
(add-to-list 'newsticker-url-list '("endlessParentheses" "http://endlessparentheses.com/atom.xml" nil nil nil))
(add-to-list 'newsticker-url-list '("包昊军的博客" "http://baohaojun.github.io/atom.xml" nil nil nil))
(add-to-list 'newsticker-url-list '("Xudifsd" "http://xudifsd.org/blog/feed/" nil nil nil))
(add-to-list 'newsticker-url-list '("A programmer's site" "http://shenfeng.me/atom.xml" nil nil nil))

;; (add-to-list 'newsticker-url-list '("Scott Young" "http://feeds.feedburner.com/scotthyoung/HAHx" nil nil nil)) 
(setq newsticker-html-renderer 'w3m-region) ;使用w3m来格式化html
(setq newsticker-automatically-mark-items-as-old nil) ;不自动将item设置为已读
(setq newsticker-show-all-news-elements t)
