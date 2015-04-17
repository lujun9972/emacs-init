;; Experimental animation (M-x nyan-start-animation, M-x nyan-stop-animation), 
;; Wavy rainbow (M-x set-variable <ret> nyan-wavy-trail <ret> t), 
(require-and-install 'nyan-mode)

(cl-case window-system
  ((x w32) (nyan-mode 1)))

(provide 'init-display-nyan)
