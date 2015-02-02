;;配置cedet
(require 'cedet)
;; semantic
(require 'semantic)
(setq semantic-default-submodes '(		
								  ;; activates automatic parsing of source code in the idle time
								  global-semantic-idle-scheduler-mode
								  ;; activates displaying of information about current tag in the idle time. Requires that global-semantic-idle-scheduler-mode was enabled.
                                  global-semantic-idle-summary-mode
								  ;; activates displaying of possible name completions in the idle time. Requires that global-semantic-idle-scheduler-mode was enabled;
								  global-semantic-idle-completions-mode
								  ;; enables global support for Semanticdb
                                  global-semanticdb-minor-mode 
								  ;; activates highlighting of first line for current tag (function,class,etc.)
								   global-semantic-highlight-func-mode
								  ;; activates mode when name of current tag will be shown in top line of buffer
								  ;; global-semantic-stickyfunc-mode
								  ;; activates use of separate styles for tags decoration (depending on tag's class). These styles are defined in the semantic-decoration-styles list;
								  ;; global-semantic-decoration-mode
								  ;; activates highlighting of local names that are the same as name of tag under cursor
								  ;; global-semantic-idle-local-symbol-highlight-mode
								  ;; shows which elements weren't processed by current parser's rules
								  global-semantic-show-unmatched-syntax-mode
								  ;; shows current parser state in the modeline
								  ;; global-semantic-show-parser-state-mode
								  ;; shows changes in the text that weren't processed by incremental parser yet
								  ;; global-semantic-highlight-edits-mode
								  ;; enables automatic bookmarking of tags that you edited, so you can return to them later with the semantic-mrub-switch-tags command
                                  global-semantic-mru-bookmark-mode))
(semantic-mode 1)

;;;; 使用外部工具生成的db
;; enable support for gnu global
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)


;;;; 设置系统目录
;; By default, Semantic automatically includes some default system include paths such as /usr/include, /usr/local/include…
;; You can view the list of include paths in semantic-dependency-system-include-path. 
;; To add more include paths, for example Boost include paths, use the function semantic-add-system-include
(defconst cedet-user-include-dirs
  (list ".." "../include"
		"../inc"
        "../../appfunc/inc" 
		(concat project-path-root "/app/appfunc/inc") 
		(concat project-path-root "/app/beps/inc") 
		(concat project-path-root "/app/hvps/inc") 
		(concat project-path-root "/app/mb/inc") 
		(concat project-path-root "/app/saps/inc") 
		(concat project-path-root "/app/ccms/inc") 
		(concat project-path-root "/app/nps/inc") 
		(concat project-path-root "/entity/inc")
		(concat project-path-root "/comm/inc")
		(concat project-path-root "/pub/inc")
		(concat project-path-root "/logger/inc")
		(concat project-path-root "/msg/inc")
		(concat project-path-root "/esbmsg/inc")
		(concat project-path-root "/esbapi/inc")))
(defconst cedet-win32-include-dirs
  (list "D:/Program Files/DEV-CPP/Include/c++/3.4.2"))
(let ((include-dirs cedet-user-include-dirs))
  (when (eq system-type 'windows-nt)
    (setq include-dirs (append include-dirs cedet-win32-include-dirs)))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))

;; 开启更多的补全功能
(require 'semantic/ia)

;; 1. 使用semantic-analyze-possible-completions 函数创建可能的补全列表
;; 2. 使用semantic-ia-complete-symbol函数进行不全
;; 3. 使用semantic-ia-complete-tip以tooltip的方式进行补全
;; 4. 使用semantic-ia-show-doc,semantic-ia-show-summary,semantic-ia-describe-class查看tag信息

;;配置tag跳转
(require 'semantic/analyze/refs) 
(defadvice push-mark (around semantic-mru-bookmark activate)
  "Push a mark at LOCATION with NOMSG and ACTIVATE passed to `push-mark'.
If `semantic-mru-bookmark-mode' is active, also push a tag onto
the mru bookmark stack."
  (semantic-mrub-push semantic-mru-bookmark-ring
                      (point)
                      'mark)
  ad-do-it)
;;自定义函数跳转函数
(defun semantic-ia-fast-jump-back ()
  (interactive)
  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
      (error "Semantic Bookmark ring is currently empty"))
  (let* ((ring (oref semantic-mru-bookmark-ring ring))
         (alist (semantic-mrub-ring-to-assoc-list ring))
         (first (cdr (car alist))))
    (if (semantic-equivalent-tag-p (oref first tag) (semantic-current-tag))
        (setq first (cdr (car (cdr alist)))))
    (semantic-mrub-switch-tags first)))
(defun semantic-ia-fast-jump-or-back (&optional back)
  (interactive "P")
  (if back
      (semantic-ia-fast-jump-back)
    (semantic-ia-fast-jump (point))))
(define-key semantic-mode-map (kbd "C-c , t") 'semantic-ia-fast-jump-or-back) ;tag跳转与跳回
(define-key semantic-mode-map (kbd "C-c , f") 'semantic-decoration-include-visit) ;打开鼠标所在位置的头文件
(define-key semantic-mode-map (kbd "C-c , s") 'semantic-analyze-proto-impl-toggle) ;h/cpp之间的互换
(define-key semantic-mode-map (kbd "C-c , c") 'semantic-symref) ;寻找tag被调用的地方,semantic-symref-symbol则会提示你输入一个tag名称
(define-key semantic-mode-map (kbd "C-RET") 'semantic-ia-complete-symbol) ;调用semantic补全
(define-key semantic-mode-map (kbd "C-c , ?") 'semantic-ia-complete-tip)
(define-key semantic-mode-map (kbd "C-c , >") 'semantic-complete-analyze-inline)

;; 使用ede管理project
(require 'ede)
(global-ede-mode t) 
(load "cedet-projects-cnaps2")

;;开启which-function-mode
;; (which-function-mode 1)

;; 配置srecode
(require 'srecode)
(global-srecode-minor-mode 1)
