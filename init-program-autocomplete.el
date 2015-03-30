;;配置auto-complete
(require-and-install 'auto-complete)
(require 'auto-complete-config)

(setq-default ac-expand-on-auto-complete nil)
(setq-default ac-auto-start 4)			;输入4个字母后自动补全
(setq-default ac-dwim nil) ; To get pop-ups with docs even if a word is uniquely completed

;;----------------------------------------------------------------------------
;; Use Emacs' built-in TAB completion hooks to trigger AC (Emacs >= 23.2)
;;----------------------------------------------------------------------------
;; 按下TAB,首先尝试缩进该行,若该行已经缩进,则进行补全
(setq tab-always-indent 'complete)  
(add-to-list 'completion-styles 'initials t)
;; Stop completion-at-point from popping up completion buffers so eagerly
(setq completion-cycle-threshold 5)

;; TODO: find solution for php, haskell and other modes where TAB always does something

(setq c-tab-always-indent nil
      c-insert-tab-function 'indent-for-tab-command)

;; hook AC into completion-at-point
(defun sanityinc/auto-complete-at-point ()
  (when (and (not (minibufferp))
	     (fboundp 'auto-complete-mode)
	     auto-complete-mode)
    #'auto-complete))

(defun sanityinc/never-indent ()
  (set (make-local-variable 'indent-line-function) (lambda () 'noindent)))

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions
        (cons 'sanityinc/auto-complete-at-point
              (remove 'sanityinc/auto-complete-at-point completion-at-point-functions))))

(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)


(set-default 'ac-sources
             '(ac-source-imenu
               ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-words-in-all-buffer))

(dolist (mode '(magit-log-edit-mode
                log-edit-mode org-mode text-mode haml-mode
                git-commit-mode
                sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                html-mode nxml-mode sh-mode smarty-mode clojure-mode
                lisp-mode textile-mode markdown-mode tuareg-mode
                js3-mode css-mode less-css-mode sql-mode
                sql-interactive-mode
                inferior-emacs-lisp-mode))
  (add-to-list 'ac-modes mode))


;; Exclude very large buffers from dabbrev
(defun sanityinc/dabbrev-friend-buffer (other-buffer)
  (< (buffer-size other-buffer) (* 1 1024 1024)))


(setq dabbrev-friend-buffer-function 'sanityinc/dabbrev-friend-buffer)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)
(setq ac-use-quick-help t)
(setq ac-quick-help-delay 1.0)
;; 这里将backspace的删除后仍旧可以触发ac补全,
;; 只要将对应的功能的函数名称加入ac-trigger-commands列表就可以
(setq ac-trigger-commands
      (cons 'backward-delete-char-untabify ac-trigger-commands))
;; 禁用自动补全
;; (setq ac-auto-start nil)
;; 设定一个触发按键
(ac-set-trigger-key "TAB")
;;设定一个指定的数字，只有连续输入了指定数目的字符以后才会开始自动补全。 
(setq ac-auto-start 2)
;; 翻看了一下auto-complete的文档，发现其中核心的函数 auto-complete 是支 持参数的：
;; (auto-complete &optional SOURCES)
;; 其中 SOURCES 是一个complete source列表，如果没有指定此参数， auto-complete 会使用buffer局部的 ac-sources 变量。
