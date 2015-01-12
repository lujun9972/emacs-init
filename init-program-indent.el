;; 清理自动产生的无用缩进
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; 自动根据文本内容推测ident的offset

(require 'dtrt-indent)
(dtrt-indent-mode 1)

;; ws-butler helps managing whitespace on every line of code written or edited, in an unobtrusive, help you write clean code without noisy whitespace effortlessly. 
(require 'ws-butler)
(add-hook 'c-mode-common-hook 'ws-butler-mode)



