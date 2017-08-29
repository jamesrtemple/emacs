;;HELM
(require 'helm)
(require 'helm-config)
(helm-mode 1)

(setq helm-yas-space-match-any-greedy t)
(setq helm-mode-fuzzy-match t)
(setq helm-recentf-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-locate-fuzzy-match nil)
(setq helm-M-x-fuzzy-match t)
(setq helm-semantic-fuzzy-match t)
(setq helm-imenu-fuzzy-match t)
(setq helm-apropos-fuzzy-match t)
(setq helm-lisp-fuzzy-completion t)
(setq helm-completion-in-region-fuzzy-match t)
(setq helm-buffer-max-length 50)

;; Make helm open along the bottom of the frame across the whole width.
(add-to-list 'display-buffer-alist
                    `(,(rx bos "*helm" (* not-newline) "*" eos)
                         (display-buffer-in-side-window)
                         (inhibit-same-window . t)
                         (window-height . 0.4)))
