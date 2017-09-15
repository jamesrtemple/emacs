;;HTML
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-hook 'web-mode 'emmet-mode)
(add-hook 'web-mode 'yas-minor-mode)
(add-hook 'web-mode 'linum-mode)
 
;;CSS
(add-hook 'css-mode-hook #'rainbow-mode)
(setq css-indent-offset 4)

;;Web Mode
(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
(setq web-mode-code-indent-offset 4)
(setq web-mode-enable-current-element-highlight t)
(eval-after-load "web-mode" '(set-face-background 'web-mode-current-element-highlight-face "DodgerBlue4"))

(eval-after-load "scss"
  '(progn
     (defun my-scss-mode-hook ()
       (diminish 'company-mode "")
       (diminish 'yas-minor-mode "")
       (diminish 'helm-mode "")
       (diminish 'git-gutter-mode ""))
     (add-hook 'scss-mode-hook 'my-scss-mode-hook)))
