;;HTML
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-hook 'web-mode 'emmet-mode)
(add-hook 'web-mode 'yas-minor-mode)
(add-hook 'web-mode 'linum-mode)
 

;;CSS
(add-hook 'css-mode-hook #'rainbow-mode)

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(setq web-mode-enable-current-element-highlight t)
(eval-after-load "web-mode" '(set-face-background 'web-mode-current-element-highlight-face "DodgerBlue4"))
