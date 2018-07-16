;;GIT GUTTER
;; (global-git-gutter-mode t)

;; (custom-set-variables '(git-gutter:update-interval 2))
;; (setq git-gutter:window-width 1)
;; (setq git-gutter:added-sign "|")
;; (setq git-gutter:modified-sign "|")
;; (setq git-gutter:deleted-sign "|")
;; (set-face-foreground 'git-gutter:modified (face-attribute 'default :background))
;; (set-face-background 'git-gutter:modified "goldenrod3")
;; (set-face-foreground 'git-gutter:added (face-attribute 'default :background))
;; (set-face-background 'git-gutter:added "DarkOliveGreen3")
;; (set-face-foreground 'git-gutter:deleted (face-attribute 'default :background))
;; (set-face-background 'git-gutter:deleted "tomato3")

;;FLY CHECK
(setq flycheck-check-syntax-automatically '(mode-enabled idle-change))
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'linum-mode)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'column)

(add-hook 'prog-mode-hook 'show-paren-mode)
