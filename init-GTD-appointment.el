(appt-activate 1)                       ;开启提醒appointment功能
(setq appt-audible t)                   ;开启appointment的声音提醒
(setq appt-display-mode-line t)         ;在mode-line上显示appointment的倒计时
(add-hook 'diary-hook 'appt-make-list)
(setq appt-issue-message t)
