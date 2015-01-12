;;开启imenu菜单,可以通过Index菜单来跳转到各个defun的地方
(add-hook 'prog-mode-hook 'imenu-add-menubar-index)
(set-default 'imenu-auto-rescan t)
