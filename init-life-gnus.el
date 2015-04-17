;;设置gnus收邮件
(setq user-full-name "lujun9972")   
(setq user-mail-address "lujun9972@gmail.com")   
(setq gnus-select-method '(nntp "news.newsfan.net"))  
;gnus语言环境设定
(require 'gnus)
(setq gnus-default-charset 'chinese-iso-8bit  
      gnus-group-name-charset-group-alist '((".*" . cn-gb-2312) ("newsgroup\\.com\\.hk" . chinese-iso-8bit))  
      gnus-summary-show-article-charset-alist  
      '((1 . utf-8)  
		(2 . gb18030)  
		(3 . chinese-iso-8bit)  
		(4 . gbk)  
		(5 . big5)  
		(6 . cn-gb-2312))  
      gnus-newsgroup-ignored-charsets  
      '(unknown-8bit x-unknown iso-8859-1)) 

(setq gnus-secondary-select-methods '((nnml ""))) ;;nnfolder，nnmbox, nnml  
;; (add-to-list 'gnus-secondary-select-methods '(nntp "news.yaako.com"))
(add-to-list 'gnus-secondary-select-methods '(nntp "freenews.netfront.net"))
(setq mail-sources '((imap :server "imap.gmail.com"
						   :port 993 
						   :user "lujun9972@gmail.com"
						   :stream ssl
						   :fetchflag "\\Seen" ;接收到的文章标记为已阅,而不是默认的\delete
						   :mailbox "INBOX"
						   ))) ;设置mail-source
(setq mail-source-delete-incoming nil) ;不删除文件,如果为正数,表示删除超过多少天的旧文件
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" ;SMTP服务器
								   587				;端口
								   "lujun9972@gmail.com" ;用户名
								   nil))				 ;密码
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

;;;;;;;;;;;;;;;;;;;    
;;自动显示图片    
;;;;;;;;;;;;;;;;;;;;    
(auto-image-file-mode)  
(setq mm-inline-large-images t)    
(add-to-list 'mm-attachment-override-types "image/*")  
  
    
(setq gnus-posting-styles    
      '((".*"    
     (name "lujun9972")  
     (address "lujun9972@gmail.com")  
     (signature "e^pi+1=0")  
     )))  
  
;;html转换成txt查看  
(eval-after-load "mm-decode"  
  '(progn  
     (add-to-list 'mm-discouraged-alternatives "text/html")  
     (add-to-list 'mm-discouraged-alternatives "text/richtext")))  

(provide 'init-life-gnus)
