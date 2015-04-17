(require-and-install 'emms)
(require 'emms-setup)
(emms-all) ;(emms-standard)  
(emms-default-players)  
(setq emms-stream-default-action "play") ;当在EMMS stream界面按下RET时的动作
;; coding settings  
(setq emms-info-mp3info-coding-system 'gbk  
	  emms-cache-file-coding-system 'utf-8  
	  ;; emms-i18n-default-coding-system '(utf-8 . utf-8)  
	  )  
;; Show the current track each time EMMS  
;; starts to play a track with "播放 : "  
(add-hook 'emms-player-started-hook 'emms-show)  
(setq emms-show-format "播放: %s")  

;; mode line format  
(setq emms-mode-line-format "[ %s ]"  
	  emms-lyrics-display-format "%s"  
	  emms-playing-time-display-format "%s")  

(setq emms-player-list '(emms-player-mplayer emms-player-mpg321) emms-player-mplayer-command-name "mplayer" emms-player-mplayer-parameters '("-slave"))
(setq emms-repeat-playlist nil
	  emms-source-file-default-directory "~/music" ;默认的音乐目录
	  emms-lyrics-dir "~/music"
	  emms-lyrics-coding-system nil
	  emms-playlist-buffer-name "*EMMS*")
;; global key-map  
;; all global keys prefix is C-c e  
;; compatible with emms-playlist mode keybindings  
;; you can view emms-playlist-mode.el to get details about  
;; emms-playlist mode keys map  
(global-set-key (kbd "C-c e >") 'emms-seek-forward)  
(global-set-key (kbd "C-c e <") 'emms-seek-backward)  
(global-set-key (kbd "C-c e t") 'emms-play-directory-tree)  
(global-set-key (kbd "C-c e h") 'emms-shuffle)  
(global-set-key (kbd "C-c e o") 'emms-play-file)  
(global-set-key (kbd "C-c e l") 'emms-play-playlist)  
(global-set-key (kbd "C-c e r") 'emms-toggle-repeat-track)  
(global-set-key (kbd "C-c e R") 'emms-toggle-repeat-playlist)  
(global-set-key (kbd "C-c e u") 'emms-score-up-playing)  
(global-set-key (kbd "C-c e d") 'emms-score-down-playing)  
(global-set-key (kbd "C-c e o") 'emms-score-show-playing)  
(global-set-key (kbd "C-c e g") 'emms-play-directory)
(global-set-key (kbd "C-c e d") 'emms-play-dired)
(global-set-key (kbd "C-c e v") 'emms-playlist-mode-go)
(global-set-key (kbd "C-c e x") 'emms-start)
(global-set-key (kbd "C-c e SPC") 'emms-pause)
(global-set-key (kbd "C-c e s") 'emms-stop)
(global-set-key (kbd "C-c e n") 'emms-next)
(global-set-key (kbd "C-c e p") 'emms-previous)
(global-set-key (kbd "C-c e f") 'emms-show)  

(provide 'init-life-media-emms)
