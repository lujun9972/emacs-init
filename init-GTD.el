(defvar GTD-HOME-PATH (filter-valid-file "e:/我的GTD/" "~/我的GTD/"))
;;;; 配置calendar
(level-require "init-GTD-calendar")
;;;; 配置diary
(level-require "init-GTD-diary")
;;;; 配置appointment
(level-require "init-GTD-appointment")
;; 使用taskjuggler来项目管理
(require 'taskjuggler-mode)
;org配置
(level-require "init-GTD-org")
;; (level-load "init-GTD-mobileorg")
;; 使用bbdb来管理联系人
(level-require "init-GTD-bbdb")

(provide 'init-GTD)
