;;------------------------------------------------------------------------------------------------------
;;COMMON SETTINGS / BASIC EMACS CONFIGURATION
;;
(setq ansi-color-names-vector                    ;;What does this do? Copied from customize section.
      ["#2e3436" "#a40000" "#4e9a06" "#c4a000"
       "#204a87" "#5c3566" "#729fcf" "#eeeeec"])

(setq backup-directory-alist                     ;;Save backup files in a central location
      `((".*" . ,temporary-file-directory)))

(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq inhibit-startup-message t)                 ;;No start screen
(scroll-bar-mode 0)                              ;;Set Scroll bars on or off
(tool-bar-mode 0)                                ;;Set toolbar off
(fringe-mode 1)                                  ;;Enable fringes
(add-to-list 'custom-theme-load-path             ;;Setup preferred theme
	     "~/.emacs.d/themes")
(load-theme 'ample t)
(global-visual-line-mode)                        ;;Make line wrap act good


;;------------------------------------------------------------------------------------------------------
;;MAC SPECIFIC SETTINGS
;;
(if (eq system-type 'darwin)
    (progn
       (set-face-attribute 'default nil :font "Menlo Regular-13")
       (setenv "PATH" (concat "/usr/local/bin:/usr/local/sbin:" (getenv "PATH")))
       (setq exec-path (append exec-path '("/usr/local/bin")))
       (setq mac-command-modifier 'control)
       (setq mac-right-command-modifier 'meta)))


;;------------------------------------------------------------------------------------------------------
;;WINDOWS SPECIFIC SETTINGS
;;
(if (eq system-type 'windows-nt)
    (set-face-attribute 'default nil :font "Lucida Console-11.5"))


;;------------------------------------------------------------------------------------------------------
;;MELPA
;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


;;------------------------------------------------------------------------------------------------------
;;TEXT
;;
(add-hook 'text-mode-hook 'turn-on-auto-fill)


;;------------------------------------------------------------------------------------------------------
;;WIN-SWITCH
;;
(require 'win-switch)
(global-set-key (kbd "C-x o") 'win-switch-dispatch)
(setq win-switch-window-threshold 1)
(setq win-switch-idle-time 15)


;;------------------------------------------------------------------------------------------------------
;;ORG
;;
(setq org-startup-with-inline-images t)
(setq org-startup-indented t)
(setq org-return-follows-link t)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-tags-column 70)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


;;------------------------------------------------------------------------------------------------------
;;MARKDOWN
;;
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;(setq markdown-command "/usr/local/bin/pandoc")
;;(set-face-attribute 'markdown-header-face nil
;; :inherit markdown-header-face
;; :height 2.0)
;;(set-face-attribute 'markdown-header-face-1 nil
;; :inherit markdown-header-face
;; :height 2.0)
;;(set-face-attribute 'markdown-header-face-2 nil
;; :inherit markdown-header-face
;; :height 1.4)


;;------------------------------------------------------------------------------------------------------
;;PANDOC
;;
(load "pandoc-mode")
(add-hook 'markdown-mode-hook 'pandoc-mode)


;;------------------------------------------------------------------------------------------------------
;;IBUFFER
;;
(global-set-key "\C-x\C-b" 'ibuffer)


;;------------------------------------------------------------------------------------------------------
;;POWERLINE
;;
(require 'powerline)
(powerline-vim-theme)


;;------------------------------------------------------------------------------------------------------
;;HELM
;;
(require 'helm-config)
(helm-mode 1)


;;------------------------------------------------------------------------------------------------------
;;NEOTREE
;;
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)


;;------------------------------------------------------------------------------------------------------
;;JAVASCRIPT
;;
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

(require 'flycheck)
(add-hook 'js-mode-hook (lambda () (flycheck-mode t)))

(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-n")

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


;;------------------------------------------------------------------------------------------------------
;;YASNIPPET
;;  Loaded before auto complete so that they can work together
;;
(require 'yasnippet)
(setq helm-yas-space-match-any-greedy t)
(global-set-key (kbd "M-s M-s") 'helm-yas-complete)
(global-set-key (kbd "M-s s") 'yas-expand)
(yas-global-mode 1)


;;------------------------------------------------------------------------------------------------------
;;AUTO COMPLETE
;;  Loaded after yasnippet so that they can work together
;;  Sets trigger to work with yasnippet on tab. If word in yasnippet, tab activates yasnippet.
;; 
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20140824.1658/dict")
(ac-config-default)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")
(put 'dired-find-alternate-file 'disabled nil)


;;------------------------------------------------------------------------------------------------------
;;TERN
;; 
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))


(require 'control-mode)
(control-mode-default-setup)
