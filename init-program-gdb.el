(setq
 ;; use gdb-many-windows by default
 ;; To use gdb-many-windows, you must always supply the -i=mi argument to gdb, otherwise gdb-many-windows won't work.
 gdb-many-windows t
 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

(provide 'init-program-gdb)
