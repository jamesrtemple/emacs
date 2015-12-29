(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(markdown-command "/usr/local/bin/pandoc"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier New" :foundry "outline" :slant normal :weight normal :height 150 :width normal))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :weight ultra-light :height 1.8))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :stipple nil :weight extra-light :height 1.4)))))

(set-face-attribute 'default t :font  "Menlo Regular-14" )

;; Save backup files in a central location
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(setenv "PATH" (concat "/usr/local/bin:/usr/local/sbin:" (getenv "PATH")))
;;(setq exec-path '("/bin", "/usr/bin", "/usr/local/bin"))

;; Tell Emacs where to find scripts
(add-to-list 'load-path "~/.emacs.d/lisp")

;; No start screen
(setq inhibit-startup-message t)

;; Color Themes
(load-theme 'ample t)

;; Turn off the extra UI stuff
;;(scroll-bar-mode -1)
;;(tool-bar-mode -1)
;;(fringe-mode -1)

;; Setup Melpa
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

; Customize text-mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

; Customize Org-Mode
(setq org-startup-with-inline-images t)
(setq org-startup-indented t)
(setq org-return-follows-link t)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-tags-column 70)

;; Dired mode
(put 'dired-find-alternate-file 'disabled nil)
(require 'dired-details)
(dired-details-install)
(setq dired-details-hidden-string "")

;; Markdown mode
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Pandoc Mode
(load "pandoc-mode")
(add-hook 'markdown-mode-hook 'pandoc-mode)

;; iBuffer
(global-set-key "\C-x\C-b" 'ibuffer)

;; PowerLine
(add-to-list 'load-path "~/.emacs.d/elpa/powerline-20140516.2128")
(require 'powerline)
(powerline-vim-theme)

;; Helm
(add-to-list 'load-path "~/.emacs.d/helm")
(require 'helm-config)
(helm-mode 1)

;; Make line wrap act good
(global-visual-line-mode)

;; changing the command to control
(setq mac-command-modifier 'control)
(setq mac-right-command-modifier 'meta)


;; javascript
(add-to-list 'load-path "~/.emacs.d/elpa/js2-mode-20150909")
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)


;; yasnippet
;; should be loaded before auto complete so that they can work together
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-20140821.38")
(require 'yasnippet)
(yas-global-mode 1)

;; auto complete mode
;; should be loaded after yasnippet so that they can work together
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20140824.1658")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20140824.1658/dict")
(ac-config-default)
;; set the trigger key so that it can work together with yasnippet on tab key,
;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;; activate, otherwise, auto-complete will
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")
