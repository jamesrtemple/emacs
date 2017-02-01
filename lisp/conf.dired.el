;;DIRED
(require 'dired)
(define-key dired-mode-map (kbd "^")
  (lambda () (interactive) (find-alternate-file "..")))
(define-key dired-mode-map (kbd "C-\\")
  (lambda () (interactive)
    (let* ((file (dired-get-filename nil t)))
      (message "Opening %s..." file)
      (call-process "open" nil 0 nil file)
      (message "Opening %s done" file))))

;;Load Dired X when Dired is loaded.
(require 'dired-x)
(setq dired-omit-mode t) 
(setq-default dired-omit-files-p t)
(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$"))
(define-key dired-mode-map (kbd ")") 'dired-omit-mode)
