(require-and-install 'dictionary)
(global-set-key [mouse-3] 'dictionary-mouse-popup-matching-words)
(global-set-key [(control c)(d)] 'dictionary-lookup-definition)
(global-set-key [(control c)(s)] 'dictionary-search)
(global-set-key [(control c)(m)] 'dictionary-match-words)
;; choose a dictionary server
(setq dictionary-server "localhost")

(provide 'init-misc-dict)
