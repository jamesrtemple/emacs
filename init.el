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
(setq explicit-shell-file-name "/bin/zsh")          ;;Default shell
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

;;Setup options that are invalid in the terminal
;;or that I only want in graphical version
(when (display-graphic-p)
  (scroll-bar-mode 0)                               ;;Set Scroll bars on or off
  (tool-bar-mode 0)                                 ;;Set toolbar off
  (fringe-mode 15)                                  ;;Enable fringes
  (set-frame-size (selected-frame) 90 60)
)
(global-visual-line-mode)                           ;;Make line wrap act good
(set-frame-font "Menlo-14")


;;MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(setq multi-term-program "/bin/zsh")

(setq-default indent-tabs-mode nil)
(setq tab-stop-list (number-sequence 4 120 4))

(global-set-key (kbd "s-g") 'magit-status)

(load-theme 'material t)

(setq tabbar-background-color "#263438") ;; the color of the tabbar background
(custom-set-faces
 '(tabbar-default ((t (:inherit variable-pitch :background "gray32" :foreground "ivory2" :weight bold))))
 '(tabbar-button ((t (:background "gray32" :foreground "ivory2" :weight bold))))
 '(tabbar-button-highlight ((t (:inherit tabbar-default))))
 '(tabbar-highlight ((t (:underline t))))
 '(tabbar-selected ((t (:inherit tabbar-default :background "DodgerBlue3"))))
 '(tabbar-separator ((t (:inherit tabbar-default :background "#263438"))))
 '(tabbar-unselected ((t (:inherit tabbar-default)))))

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
(load "conf.html")
(load "conf.javascript")
(load "conf.typescript")
(load "conf.projectile")
(load "conf.keybindings")

(setq winner-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
(jade karma multi-term rjsx-mode material-theme win-switch web-mode web-beautify use-package unicode-fonts tide tabbar spaceline smooth-scrolling rainbow-delimiters pandoc-mode osx-pseudo-daemon org-bullets neotree multiple-cursors monokai-theme markdown-mode magit json-mode js2-mode js-comint impatient-mode helm-projectile helm-descbinds helm-company helm-c-yasnippet expand-region emmet-mode company-tern company-quickhelp color-theme-sanityinc-tomorrow browse-kill-ring ample-theme all-the-icons-dired ace-window ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(spaceline-highlight-face ((t (:foreground "azure2" :background "LightBlue4" \.\.\.)))))
