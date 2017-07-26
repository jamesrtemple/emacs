;;GIT GUTTER
(global-git-gutter-mode t)
(git-gutter:linum-setup)
(custom-set-variables '(git-gutter:update-interval 2))
(setq git-gutter:window-width 1)
(setq git-gutter:modified-sign " ")
(setq git-gutter:added-sign " ")
(setq git-gutter:deleted-sign " ")

;;FLY CHECK
(setq flycheck-check-syntax-automatically '(mode-enabled idle-change))

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'linum-mode)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;;LINE NUMBERS
(setq linum-format " %2d  ")

;;(set-face-attribute 'fringe nil :background "#151718" :foreground "#3F3F3F")
;;(add-hook 'linum-mode-hook (lambda() 
;;    (set-face-attribute 'linum nil :background "#151718")))


(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'column)

(add-hook 'prog-mode-hook 'show-paren-mode)

