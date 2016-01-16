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
(load-theme 'granger t)
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
(global-set-key (kbd "C-o") 'win-switch-enter)
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
(powerline-center-theme)


;;------------------------------------------------------------------------------------------------------
;;IDO
;;
(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)
(setq org-completion-use-ido t)
(setq magit-completing-read-function 'magit-ido-completing-read)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)


;;------------------------------------------------------------------------------------------------------
;;SMEX
;;
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;;------------------------------------------------------------------------------------------------------
;;NEOTREE
;;
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-window-width 40)


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


;;------------------------------------------------------------------------------------------------------
;;CONTROL
;; 
(require 'control-mode)
(control-mode-default-setup)


;;RAINBOW DELIMITERS
 (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require 'smooth-scrolling)

(require 'indent-guide)
(indent-guide-global-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("743d86e52a227ba0c77e0b6249ec89eb735591a59bdc25ff58dcbfdb0db84d22" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "46fd293ff6e2f6b74a5edf1063c32f2a758ec24a5f63d13b07a20255c074d399" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "998aec317c45ba985ca740770a30cfc5e2ec3a8d5c0d626c011bfcd11f7dabd0" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "1a85b8ade3d7cf76897b338ff3b20409cb5a5fbed4e45c6f38c98eee7b025ad4" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "7bde52fdac7ac54d00f3d4c559f2f7aa899311655e7eb20ec5491f3b5c533fe8" "2b5aa66b7d5be41b18cc67f3286ae664134b95ccc4a86c9339c886dfd736132d" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
