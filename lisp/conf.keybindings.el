(setq mac-command-modifier 'control)
(setq mac-option-modifier 'meta)
(setq mac-control-modifier 'super)

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "s-n") 'neotree-toggle)
(global-set-key (kbd "s-o") 'win-switch-enter)
(global-set-key (kbd "s-j") 'ace-jump-mode)
(global-set-key (kbd "s-y") 'helm-yas-complete)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-c \C-l" 'org-insert-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(define-key company-mode-map (kbd "s-;") 'helm-company)
(define-key company-active-map (kbd "s-;") 'helm-company)

(global-set-key (kbd "s-g") 'magit-status)

(global-set-key (kbd "s-t") 'get-term)

(global-set-key (kbd "s-v") 'visual-line-mode)

;;DIRED KEYMAP
(define-key dired-mode-map (kbd ")") 'dired-omit-mode)

;MOVE INTO A DIRECTORY
(define-key dired-mode-map (kbd "C-j")
  (lambda () (interactive) (dired-find-alternate-file)))

;MOVE UP A DIRECTORY
(define-key dired-mode-map (kbd "C-l")
  (lambda () (interactive) (find-alternate-file "..")))

(define-key dired-mode-map (kbd "C-\\")
  (lambda () (interactive)
    (let* ((file (dired-get-filename nil t)))
      (message "Opening %s..." file)
      (call-process "open" nil 0 nil file)
      (message "Opening %s done" file))))

;;HORIZONTAL SCROLLING
(defun my/scroll-right() (interactive) (scroll-right 2))
(defun my/scroll-left() (interactive) (scroll-left 2))
(global-set-key (kbd "<wheel-left>") 'my/scroll-right)
(global-set-key (kbd "<double-wheel-left>") 'my/scroll-right)
(global-set-key (kbd "<triple-wheel-left>") 'my/scroll-right)
(global-set-key (kbd "<wheel-right>") 'my/scroll-left)
(global-set-key (kbd "<double-wheel-right>") 'my/scroll-left)
(global-set-key (kbd "<triple-wheel-right>") 'my/scroll-left)


;;HYDRAS
(global-set-key (kbd "s-.") 'hydra-window-menu/body)
(global-set-key (kbd "<f1>") 'yt-hydra/help/body)
(global-set-key (kbd "s-r") 'hydra-register-menu/body)
(global-set-key (kbd "s-p") 'hydra-project/body)

