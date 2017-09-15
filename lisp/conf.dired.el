(use-package dired
  :init
  (require 'dired-x)
  :config
  (setq dired-omit-mode t) 
  (setq-default dired-omit-files-p t)
  (setq dired-omit-files (concat dired-omit-files "\\|^\\..+$")))
