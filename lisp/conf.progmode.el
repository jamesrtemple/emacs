;;GIT GUTTER
(global-git-gutter-mode t)
(git-gutter:linum-setup)
(custom-set-variables '(git-gutter:update-interval 2))

;;FLY CHECK
(setq flycheck-check-syntax-automatically '(mode-enabled idle-change))

;;RAINBOW DELIMITERS
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'linum-mode)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(setq linum-format "%3d  ")
