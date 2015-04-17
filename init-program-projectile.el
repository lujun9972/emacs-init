(require-and-install 'projectile)

;; 默认全局使用
(projectile-global-mode)
;; 默认打开缓存
(setq projectile-enable-caching t)
;; 使用f5键打开默认文件搜索
(global-set-key [f3] 'projectile-find-file)

(provide 'init-program-projectile)
