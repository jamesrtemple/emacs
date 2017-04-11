;;GIT GUTTER
(global-git-gutter-mode t)
(git-gutter:linum-setup)
(custom-set-variables '(git-gutter:update-interval 2))
(setq git-gutter:window-width 1)
(setq git-gutter:modified-sign "=")
(setq git-gutter:added-sign "+")
(setq git-gutter:deleted-sign "-")
(set-face-foreground 'git-gutter:modified "DarkOrange3")
(set-face-foreground 'git-gutter:added "DarkOliveGreen3")
(set-face-foreground 'git-gutter:deleted "tomato3")

;;FLY CHECK
(setq flycheck-check-syntax-automatically '(mode-enabled idle-change))

;;RAINBOW DELIMITERS
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'linum-mode)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;;LINE NUMBERS
(setq linum-format " %2d")

(set-face-attribute 'fringe nil :background "#151718" :foreground "#3F3F3F")
(set-face-attribute 'linum nil :background "#151718")
