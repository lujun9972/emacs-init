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
  )

