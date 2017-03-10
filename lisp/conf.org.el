;;ORG MODE
(setq org-startup-with-inline-images t)
(setq org-startup-indented t)
(setq org-return-follows-link t)
(setq org-tags-column 70)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(add-hook 'org-mode-hook 'flyspell-mode 1)


(set-face-attribute 'org-level-1 nil
                    :height 2.0
                    :family "Averia-sans"
                    :foreground "NavajoWhite2"
                    :weight 'ultra-light
                    :background nil)

(set-face-attribute 'org-level-2 nil
                    :height 1.2
                    :family "Averia-sans"
                    :foreground "cornsilk3"
                    :weight 'ultra-light
                    :background nil)
