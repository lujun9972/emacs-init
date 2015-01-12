;日程安排
(defvar GTD-HOME-PATH "e:/我的GTD/")
;;在mode-line显示时间
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time-mode 1)
(setq todo-file-do (concat GTD-HOME-PATH "todo/do"))
(setq todo-file-done (concat GTD-HOME-PATH "todo/done"))
(setq todo-file-top (concat GTD-HOME-PATH "todo/top"))
(setq diary-file (concat GTD-HOME-PATH "diary"))
(setq diary-mail-addr "lujun9972@sina.com")
(add-hook 'diary-hook 'appt-make-list)
(setq calendar-date-style 'iso)         ;设置diary中的date格式
