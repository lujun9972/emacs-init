;;;; 配置calendar
(load "init-GTD-calendar")
;;;; 配置diary
(load "init-GTD-diary")
;;;; 配置appointment
(load "init-GTD-appointment")
;; 使用taskjuggler来项目管理
(require 'taskjuggler-mode)
;org配置
(level-load "init-GTD-org")
(level-load "init-GTD-mobileorg")
;; 使用bbdb来管理联系人
(level-load "init-GTD-bbdb")
