;;DIRED
(require 'dired)

;;Load Dired X when Dired is loaded.
(require 'dired-x)
(setq dired-omit-mode t) 
(setq-default dired-omit-files-p t)
(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$"))

;;Add icons to dired
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
