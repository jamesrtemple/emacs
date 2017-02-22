(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8ec2e01474ad56ee33bc0534bdbe7842eea74dccfb576e09f99ef89a705f5501" default)))
 '(package-selected-packages
   (quote
    (all-the-icons-dired all-the-icons helm-company win-switch web-mode web-beautify use-package unicode-fonts tide tabbar smooth-scrolling rainbow-delimiters pandoc-mode osx-pseudo-daemon org-bullets neotree multiple-cursors markdown-mode magit json-mode js2-mode js-comint impatient-mode helm-projectile helm-descbinds helm-c-yasnippet expand-region emmet-mode company-tern company-quickhelp color-theme-sanityinc-tomorrow browse-kill-ring ample-theme ace-window ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;COMMON SETTINGS / BASIC EMACS CONFIGURATION
(add-to-list 'load-path "~/.emacs.d/lisp/")
(setq auto-save-default nil)                        ;;Disable auto-saved files
(setq make-backup-files nil)                        ;;Disable auto-backup files
(setq inhibit-startup-message t)                    ;;No start screen
(setq ring-bell-function 'ignore)                   ;;Turn off that damn bell!
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;;Scrolling
(setq mouse-wheel-progressive-speed nil)
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

(setq winner-mode t)

(setq-default indent-tabs-mode nil)
(setq tab-stop-list (number-sequence 4 120 4))

(load "conf.modeline")
(load "conf.theme")
(load "conf.mac")
(load "conf.dired")
(load "conf.winswitch_ace")
(load "conf.neotree")
(load "conf.helm")
(load "conf.progmode")
(load "conf.expandregion")
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

