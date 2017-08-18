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
(setq tab-width 2)
(setq tab-stop-list (number-sequence 4 120 4))
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(global-visual-line-mode)                           ;;Make line wrap act good

(add-hook 'text-mode-hook '(lambda () (setq truncate-lines nil)))
(add-hook 'prog-mode-hook '(lambda () (setq truncate-lines t)))

;;Setup options that are invalid in the terminal
;;or that I only want in graphical version
(when (display-graphic-p)
  (scroll-bar-mode 0)                               ;;Set Scroll bars on or off
  (tool-bar-mode 0)                                 ;;Set toolbar off
  (fringe-mode 10)                                   ;;Enable fringes
  (set-frame-size (selected-frame) 90 50))

;;MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;;THEME STUFF
;;(load-theme 'ample t)
;;(load-theme 'ujelly t)
;;(load-theme 'gruber-darker t)
;;(load-theme 'clues t)
(load-theme 'darkburn t)
;;(load-theme 'tango-plus t)

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
(load "conf.completion")
(load "conf.hydra")
(load "conf.registers")
(load "conf.htmlcss")
(load "conf.javascript")
(load "conf.typescript")
(load "conf.projectile")
(load "conf.keybindings")

(winner-mode 1)
(set-face-attribute 'fringe nil :background nil)
(diminish 'git-gutter-mode "")
(diminish 'helm-mode "")
(diminish 'company-mode "")
(diminish 'yas-minor-mode "")
(diminish 'pandoc-mode "")
(diminish 'tern-mode "")

(require 'less-css-mode)
(add-to-list 'auto-mode-alist '("\\.less$" . less-css-mode))
