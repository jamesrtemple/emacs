;;COMMON SETTINGS / BASIC EMACS CONFIGURATION
(setq ansi-color-names-vector                    ;;What does this do? Copied from customize section.
      ["#2e3436" "#a40000" "#4e9a06" "#c4a000"
       "#204a87" "#5c3566" "#729fcf" "#eeeeec"])

(setq auto-save-default nil)                     ;;Disable auto-saved files
(setq make-backup-files nil)                     ;;Disable auto-backup files
(setq inhibit-startup-message t)                 ;;No start screen


;;Setup options that are invalid in the terminal
(when (display-graphic-p)
  (scroll-bar-mode 0)                              ;;Set Scroll bars on or off
  (tool-bar-mode 0)                                ;;Set toolbar off
  (fringe-mode 2)                                 ;;Enable fringes  
)

(put 'narrow-to-region 'disabled nil)            
(global-visual-line-mode)                        ;;Make line wrap act good

;;Setup preferred theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'custom-theme-load-path "~/.emacs.d/colorthemes")
(if (display-graphic-p)
    (progn
      (load-theme 'junio t))
  (load-theme 'arjen t t)
  (enable-theme 'arjen))


;;MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


;;MAC SPECIFIC SETTINGS
(if (eq system-type 'darwin)
    (progn
       (setenv "PATH" (concat "/usr/local/bin:/usr/local/sbin:" (getenv "PATH")))
       (setq exec-path (append exec-path '("/usr/local/bin")))
       (setq mac-command-modifier 'control)))


;;POWERLINE
(powerline-vim-theme)

 
;;WIN-SWITCH
(require 'win-switch)
(global-set-key (kbd "C-o") 'win-switch-enter)
(setq win-switch-window-threshold 1)
(setq win-switch-idle-time 15)


;; BUFFER SWITCHING
(global-set-key (kbd "C-|") 'ibuffer)
(global-set-key (kbd "C-\\") 'ido-switch-buffer)


;;IDO
(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)
(setq org-completion-use-ido t)
(setq magit-completing-read-function 'magit-ido-completing-read)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)


;;SMEX
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


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


;;AUTO COMPLETE
;;  Loaded after yasnippet so that they can work together
;;  Sets trigger to work with yasnippet on tab. If word in yasnippet, tab activates yasnippet.
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20140824.1658/dict")
(ac-config-default)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")
(put 'dired-find-alternate-file 'disabled nil)


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


;;----------------------------------------------------------------------
;;JAVASCRIPT
;;
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(add-hook 'js2-mode-hook 'indent-guide-mode)
(yas-reload-all)
(add-hook 'js2-mode-hook 'yas-minor-mode)

(require 'flycheck)
(add-hook 'js-mode-hook (lambda () (flycheck-mode t)))

(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-n")

;;TERN
(add-hook 'js2-mode-hook (lambda ()
			   (tern-mode t)))
(eval-after-load 'tern '(progn
			  (require 'tern-auto-complete)
			  (tern-ac-setup)))

;;NODE REPL
(setq inferior-js-program-command "node")
(add-hook 'js2-mode-hook '(lambda () 
			    (local-set-key "\C-x\C-e" 'js-send-last-sexp) ;
			    (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
			    (local-set-key "\C-cb" 'js-send-buffer)
			    (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
			    (local-set-key "\C-cl" 'js-load-file-and-go)
			    ))

(setenv "NODE_NO_READLINE" "1")

(setq httpd-root "~/Desktop")
;;END JAVASCRIPT


(defun prompt ()
  "Open a shell below the current window"
  (interactive)
  (progn
    (split-window-below -10)
    (other-window 1)
    (shell)))








(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("fe349b21bb978bb1f1f2db05bc87b2c6d02f1a7fe3f27584cd7b6fbf8e53391a" "5eb4b22e97ddb2db9ecce7d983fa45eb8367447f151c7e1b033af27820f43760" "b8c5adfc0230bd8e8d73450c2cd4044ad7ba1d24458e37b6dec65607fc392980" "8530b2f7b281ea6f263be265dd8c75b502ecd7a30b9a0f28fa9398739e833a35" "1a094b79734450a146b0c43afb6c669045d7a8a5c28bc0210aba28d36f85d86f" "9bd5ee2b24759fbc97f86c2783d1bf8f883eb1c0dd2cf7bda2b539cd28abf6a9" "2d5c40e709543f156d3dee750cd9ac580a20a371f1b1e1e3ecbef2b895cf0cd2" "2047464bf6781156ebdac9e38a17b97bd2594b39cfeaab561afffcbbe19314e2" "392f19e7788de27faf128a6f56325123c47205f477da227baf6a6a918f73b5dc" "a455366c5cdacebd8adaa99d50e37430b0170326e7640a688e9d9ad406e2edfd" default)))
 '(package-selected-packages
   (quote
    (color-theme-modern win-switch web-mode web-beautify unicode-fonts tern-auto-complete smooth-scrolling smex rainbow-delimiters powerline pandoc-mode org-bullets neotree markdown-mode magit js2-refactor js-comint indent-guide impatient-mode ido-vertical-mode ido-ubiquitous helm-c-yasnippet flycheck expand-region emms emmet-mode browse-kill-ring ace-jump-mode ac-js2))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
