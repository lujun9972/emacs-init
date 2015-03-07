
(require 'org-mobile)

(setq org-mobile-directory "~/mobileorg")

(setq org-mobile-files '("~/我的GTD/office.org"
                             "~/我的GTD/home.org"
                             ))

(setq org-directory "~/我的GTD")

(setq org-mobile-inbox-for-pull "~/我的GTD/from-mobile.org")

(defcustom org-mobile-checksum-binary (or (executable-find "md5sum"))
 "Executable used for computing checksums of agenda files."
 :group 'org-mobile
 :type 'string)
