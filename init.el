
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(spaceline-highlight-face ((t (:foreground "azure2" :background "LightBlue4" \.\.\.))))
 '(tabbar-button ((t (:background "gray32" :foreground "ivory2" :weight bold))))
 '(tabbar-button-highlight ((t (:inherit tabbar-default))))
 '(tabbar-default ((t (:inherit variable-pitch :background "gray32" :foreground "ivory2" :weight bold))))
 '(tabbar-highlight ((t (:underline t))))
 '(tabbar-selected ((t (:inherit tabbar-default :background "DodgerBlue3"))))
 '(tabbar-separator ((t (:inherit tabbar-default :background "#263438"))))
 '(tabbar-unselected ((t (:inherit tabbar-default)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#263238"))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(fci-rule-color "#37474f")
 '(git-gutter:update-interval 2)
 '(hl-sexp-background-color "#1c1f26")
 '(org-return-follows-link t)
 '(org-startup-indented t)
 '(org-startup-with-inline-images t)
 '(org-tags-column 70)
 '(package-selected-packages
   (quote
    (ag color-theme-sanityinc-solarized git-gutter rainbow-mode exec-path-from-shell page-break-lines window-numbering jade karma multi-term rjsx-mode material-theme win-switch web-mode web-beautify use-package unicode-fonts tide tabbar spaceline smooth-scrolling rainbow-delimiters pandoc-mode osx-pseudo-daemon org-bullets neotree multiple-cursors monokai-theme markdown-mode magit json-mode js2-mode js-comint impatient-mode helm-projectile helm-descbinds helm-company helm-c-yasnippet expand-region emmet-mode company-tern company-quickhelp color-theme-sanityinc-tomorrow browse-kill-ring ample-theme all-the-icons-dired ace-window ace-jump-mode)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))

;;JUMP TO PERSONAL CONFIGURATION
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "conf.master")
