;;WIN-SWITCH
(require 'win-switch)
(global-set-key (kbd "s-o") 'win-switch-enter)
(setq win-switch-window-threshold 1)
(setq win-switch-idle-time 15)


;;ACE-WINDOW
(global-set-key (kbd "M-p") 'ace-window)


;;ACE JUMP
(global-set-key (kbd "C-z") 'ace-jump-mode)


;; BUFFER SWITCHING
(global-set-key (kbd "C-|") 'ibuffer)
