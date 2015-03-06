(defvar cnaps2-project-root-path
  (filter-valid-file "e:/git-svn/server"  "/cygdrive/e/git-svn/server" "~/trunk"))

(defvar system-include-path 
  (filter-valid-files "D:/Program Files/DEV-CPP/Include/c++/3.4.2" "/usr/include"))
(when cnaps2-project-root-path
  (ede-cpp-root-project "cnaps2"
			:file (concat cnaps2-project-root-path "/makeall")
			;; :include-path specifies directories local to your projects that EDE should search first when looking for a header file. :incluide-path is relative to project root specified in :file. 
			:include-path '("/app/appfunc/inc"
					"/app/beps/inc"
					"/app/hvps/inc"
					"/app/mb/inc"
					"/app/saps/inc"
					"/app/ccms/inc"
					"/app/nps/inc"
					"/entity/inc"
					"/comm/inc" 
					"/pub/inc" 
					"/logger/inc" 
					"/msg/inc" 
					"/esbmsg/inc" 
					"/esbapi/inc")
			:system-include-path system-include-path)
  (require 'semantic/bovine/c)
  (add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat cnaps2-project-root-path "/app/appfunc/inc/pubfunchandler.h"))
  (add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat cnaps2-project-root-path "/pub/inc/macro.hpp"))
  (add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat cnaps2-project-root-path "/app/appfunc/inc/cnaps2pubfunc.h"))
  (add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat cnaps2-project-root-path "/cfca/inc/cfcaappapi.h"))
  (add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat cnaps2-project-root-path "/comm/inc/mqagent.h"))
  (add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat cnaps2-project-root-path "/esbapi/inc/esb_front_internal.h"))
  (add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat cnaps2-project-root-path "/pub/inc/basic.h"))

  ;; 使用smart-compile来编译
  ;; 通过smart-compile可以根据major-mode或文件名称来选择不同的compile-command
  (require-and-install 'smart-compile)
  ;; 编译sendtonps
  (add-to-list 'smart-compile-alist
	       '("sendnps.+\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/nps;make sendtonps\""))
  (add-to-list 'smart-compile-alist
	       '("sendnps.+\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/nps;make sendtonps\""))

  ;; 编译recvfromnps
  (add-to-list 'smart-compile-alist
	       '("recvnps.+\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/nps;make recvfromnps\""))
  (add-to-list 'smart-compile-alist
	       '("recvnps.+\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/nps;make recvfromnps\""))

  ;; 编译sendtobeps
  (add-to-list 'smart-compile-alist
	       '("sendbeps.+\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/beps;make sendtobeps\""))
  (add-to-list 'smart-compile-alist
	       '("sendbeps.+\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/beps;make sendtobeps\""))

  ;; 编译recvfrombeps
  (add-to-list 'smart-compile-alist
	       '("recvbeps.+\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/beps;make recvfrombeps\""))
  (add-to-list 'smart-compile-alist
	       '("recvbeps.+\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/beps;make recvfrombeps\""))

  ;; 编译sendtohvps
  (add-to-list 'smart-compile-alist
	       '("sendhvps.+\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/hvps;make sendtohvps\""))
  (add-to-list 'smart-compile-alist
	       '("sendhvps.+\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/hvps;make sendtohvps\""))

  ;; 编译recvfromhvps
  (add-to-list 'smart-compile-alist
	       '("recvhvps.+\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/hvps;make recvfromhvps\""))
  (add-to-list 'smart-compile-alist
	       '("recvhvps.+\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/hvps;make recvfromhvps\""))

  ;; 编译sendtoccms
  (add-to-list 'smart-compile-alist
	       '("sendccms.+\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/ccms;make sendtoccms\""))
  (add-to-list 'smart-compile-alist
	       '("sendccms.+\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/ccms;make sendtoccms\""))

  ;; 编译recvfromccms
  (add-to-list 'smart-compile-alist
	       '("recvccms.+\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/ccms;make recvfromccms\""))
  (add-to-list 'smart-compile-alist
	       '("recvccms.+\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/ccms;make recvfromccms\""))

  ;; 编译sendtosaps
  (add-to-list 'smart-compile-alist
	       '("sendsaps.+\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/saps;make sendtosaps\""))
  (add-to-list 'smart-compile-alist
	       '("sendsaps.+\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/saps;make sendtosaps\""))

  ;; 编译recvfromsaps
  (add-to-list 'smart-compile-alist
	       '("recvsaps.+\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/saps;make recvfromsaps\""))
  (add-to-list 'smart-compile-alist
	       '("recvsaps.+\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/saps;make recvfromsaps\""))

  ;; 编译sendtomb
  (add-to-list 'smart-compile-alist
	       '("sendmb.+\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/mb;make sendtomb\""))
  (add-to-list 'smart-compile-alist
	       '("sendmb.+\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/mb;make sendtomb\""))

  ;; 编译recvfrommb
  (add-to-list 'smart-compile-alist
	       '("recvmb.+\.cpp$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/mb;make recvfrommb;make recvfromclt\""))
  (add-to-list 'smart-compile-alist
	       '("recvmb.+\.h$" . "plink cnaps2@10.8.6.10 \". ~/.profile;cd app/mb;make recvfrommb;make recvfromclt\""))
  )
