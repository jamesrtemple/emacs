;;HTML
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-hook 'web-mode 'emmet-mode)
(add-hook 'web-mode 'yas-minor-mode)
(add-hook 'web-mode 'linum-mode)
