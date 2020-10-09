(require 'dired-x)

(add-hook 'dired-mode-hook 'dired-omit-mode)

(setq dired-omit-mode t) 
(setq-default dired-omit-files-p t)
(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$"))

