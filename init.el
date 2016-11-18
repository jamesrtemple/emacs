;;COMMON SETTINGS / BASIC EMACS CONFIGURATION
(setq auto-save-default nil)                     ;;Disable auto-saved files
(setq make-backup-files nil)                     ;;Disable auto-backup files
(setq inhibit-startup-message t)                 ;;No start screen


;;Setup options that are invalid in the terminal
;;or that I only want in graphical version
(when (display-graphic-p)
  (scroll-bar-mode 0)                              ;;Set Scroll bars on or off
  (tool-bar-mode 0)                                ;;Set toolbar off
  (fringe-mode 5)                                  ;;Enable fringes
  (set-frame-size (selected-frame) 160 60) 
)

(put 'narrow-to-region 'disabled nil)            
(global-visual-line-mode)                        ;;Make line wrap act good
(setq explicit-shell-file-name "/bin/zsh")

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)


;;Setup preferred theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'custom-theme-load-path "~/.emacs.d/colorthemes")
(if (display-graphic-p)
    (load-theme 'monokai t))


;;MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


;;MAC SPECIFIC SETTINGS
(if (eq system-type 'darwin)
    (progn
       (setenv "PATH" (concat "/usr/local/bin:/usr/local/sbin:" (getenv "PATH")))
       (setq exec-path (append exec-path '("/usr/local/bin")))
       (setq mac-command-modifier 'control)
       (set-terminal-coding-system 'utf-8)
       (set-keyboard-coding-system 'utf-8)
       (prefer-coding-system 'utf-8)))


;;MODELINE
(powerline-vim-theme)

 
;;WIN-SWITCH
(require 'win-switch)
(global-set-key (kbd "C-o") 'win-switch-enter)
(setq win-switch-window-threshold 1)
(setq win-switch-idle-time 15)


;; BUFFER SWITCHING
(global-set-key (kbd "C-|") 'ibuffer)
(global-set-key (kbd "C-\\") 'ido-switch-buffer)


;;EXPAND REGION
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


;;ACE JUMP
(global-set-key (kbd "C-z") 'ace-jump-mode)


;;RAINBOW DELIMITERS
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)


;;YASNIPPET
;;  Loaded before auto complete so that they can work together
(require 'yasnippet)
;; Completing point by some yasnippet key
(defun yas-ido-expand ()
  "Lets you select (and expand) a yasnippet key"
  (interactive)
    (let ((original-point (point)))
      (while (and
              (not (= (point) (point-min) ))
              (not
               (string-match "[[:space:]\n]" (char-to-string (char-before)))))
        (backward-word 1))
    (let* ((init-word (point))
           (word (buffer-substring init-word original-point))
           (list (yas-active-keys)))
      (goto-char original-point)
      (let ((key (remove-if-not
                  (lambda (s) (string-match (concat "^" word) s)) list)))
        (if (= (length key) 1)
            (setq key (pop key))
          (setq key (ido-completing-read "key: " list nil nil word)))
        (delete-char (- init-word original-point))
        (insert key)
        (yas-expand)))))
(global-set-key (kbd "M-s M-s") 'yas-ido-expand)
(global-set-key (kbd "M-s s") 'yas-expand)
;(yas-global-mode 1)


;;NEOTREE
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-window-width 40)


;;TEXT MODE
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'flyspell-mode 1)


;;ORG MODE
(setq org-startup-with-inline-images t)
(setq org-startup-indented t)
(setq org-return-follows-link t)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-tags-column 70)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(add-hook 'org-mode-hook 'flyspell-mode 1)


;;MARKDOWN MODE
(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(setq markdown-command "/usr/local/bin/pandoc")
(set-face-attribute 'markdown-header-face nil
		    :inherit markdown-header-face
		    :height 1.5)
(set-face-attribute 'markdown-header-face-1 nil
		    :inherit markdown-header-face
		    :height 1.5)
(set-face-attribute 'markdown-header-face-2 nil
		    :inherit markdown-header-face
		    :height 1.4)
(add-hook 'markdown-mode-hook 'flyspell-mode 1)


;;PANDOC
(load "pandoc-mode")
(add-hook 'markdown-mode-hook 'pandoc-mode)


;;COMPANY
(require 'company)
(add-to-list 'company-backends 'company-tern)
(global-company-mode)
(company-quickhelp-mode 1)


;;HTML
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-hook 'web-mode 'emmet-mode)
(add-hook 'web-mode 'yas-minor-mode)


;;JAVASCRIPT
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(yas-reload-all)
(add-hook 'js2-mode-hook 'yas-minor-mode)

(require 'flycheck)
(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-n")

(add-hook 'js2-mode-hook 'myJs2ModeHook)

(defun myJs2ModeHook()
  (company-tern t)
  (flycheck-mode t)
  (tern-mode t))
;;END JAVASCRIPT


;;TYPESCRIPT
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; format options
(setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil))
;;END TYPESCRIPT


;;PROJECTILE
(setq projectile-indexing-method 'native)
(helm-projectile-on)

;;HELM
(require 'helm)
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)


;;MINIMAP
(minimap-mode)
(setq minimap-window-location 'right)
(setq minimap-major-modes '(prog-mode typescript-mode))
(put 'dired-find-alternate-file 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-quickhelp helm-descbinds impatient-mode win-switch web-mode web-beautify unicode-fonts tide smooth-scrolling rainbow-delimiters powerline pandoc-mode org-bullets neotree minimap markdown-mode magit json-mode js2-refactor js-comint indent-guide helm-projectile helm-c-yasnippet expand-region emmet-mode company-tern color-theme-modern browse-kill-ring ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
