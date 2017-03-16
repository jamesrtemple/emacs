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
    (color-theme-sanityinc-solarized git-gutter rainbow-mode exec-path-from-shell page-break-lines window-numbering jade karma multi-term rjsx-mode material-theme win-switch web-mode web-beautify use-package unicode-fonts tide tabbar spaceline smooth-scrolling rainbow-delimiters pandoc-mode osx-pseudo-daemon org-bullets neotree multiple-cursors monokai-theme markdown-mode magit json-mode js2-mode js-comint impatient-mode helm-projectile helm-descbinds helm-company helm-c-yasnippet expand-region emmet-mode company-tern company-quickhelp color-theme-sanityinc-tomorrow browse-kill-ring ample-theme all-the-icons-dired ace-window ace-jump-mode)))
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



;;COMMON SETTINGS / BASIC EMACS CONFIGURATION
(add-to-list 'load-path "~/.emacs.d/lisp/")
(setq auto-save-default nil)                        ;;Disable auto-saved files
(setq make-backup-files nil)                        ;;Disable auto-backup files
(setq inhibit-startup-message t)                    ;;No start screen
(setq ring-bell-function 'ignore)                   ;;Turn off that damn bell!
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;;Scrolling
(setq mouse-wheel-progressive-speed t)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)
(setq-default indent-tabs-mode nil)
(setq tab-stop-list (number-sequence 4 120 4))
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(global-visual-line-mode)                           ;;Make line wrap act good

;;Setup options that are invalid in the terminal
;;or that I only want in graphical version
(when (display-graphic-p)
  (scroll-bar-mode 0)                               ;;Set Scroll bars on or off
  (tool-bar-mode 0)                                 ;;Set toolbar off
  (fringe-mode 15)                                  ;;Enable fringes
  (set-frame-size (selected-frame) 90 50)
)

;;MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;;THEME STUFF
(color-theme-sanityinc-tomorrow-night)
(setq tabbar-background-color "#263438") ;; the color of the tabbar background
(window-numbering-mode)

(electric-pair-mode t)

(load "conf.term")
(load "conf.modeline")
(load "conf.mac")
(load "conf.dired")
(load "conf.winswitch_ace")
(load "conf.neotree")
(load "conf.helm")
(load "conf.progmode")
(load "conf.text")
(load "conf.org")
(load "conf.markdown") ;;and pandoc
(load "conf.yasnippet")
(load "conf.company")
(load "conf.hydra")
(load "conf.htmlcss")
(load "conf.javascript")
(load "conf.typescript")
(load "conf.projectile")
(load "conf.keybindings")

(setq winner-mode t)

