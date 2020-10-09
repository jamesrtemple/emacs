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
  (fringe-mode 10)                                  ;;Enable fringes
  (set-frame-size (selected-frame) 100 50))

;;MELPA
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;;THEME STUFF
(load-theme 'seti t)

(electric-pair-mode t)

(load "conf.term")
(load "conf.modeline")
(load "conf.mac")
(load "conf.dired")
(load "conf.helm")
(load "conf.text")
(load "conf.org")
(load "conf.markdown") ;;and pandoc
(load "conf.completion")
(load "conf.keybindings")

(winner-mode 1)
(set-face-attribute 'fringe nil :background nil)

(diminish 'git-gutter-mode "")
(diminish 'helm-mode "")
(diminish 'company-mode "")
(diminish 'yas-minor-mode "")
(diminish 'pandoc-mode "")
(diminish 'tern-mode "")
(diminish 'eldoc-mode "")
(diminish 'visual-line-mode
   (concat " " (propertize (fontawesome "refresh")
                           'face '(:family "FontAwesome"))))

(require 'less-css-mode)
(add-to-list 'auto-mode-alist '("\\.less$" . less-css-mode))


(set-face-foreground 'dired-directory "Goldenrod3")


(defun shell-region (start end)
  "execute region in an inferior shell"
  (interactive "r")
  (shell-command  (buffer-substring-no-properties start end)))


(dired "~")
