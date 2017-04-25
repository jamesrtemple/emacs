
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(git-gutter:update-interval 2)
 '(package-selected-packages
   (quote
    (git-timemachine ujelly-theme darktooth-theme cyberpunk-theme window-numbering win-switch web-mode web-beautify use-package unicode-fonts tide tabbar smooth-scrolling seti-theme rjsx-mode rainbow-mode rainbow-delimiters powerline pandoc-mode page-break-lines osx-pseudo-daemon org-bullets neotree multiple-cursors multi-term markdown-mode magit karma json-mode js-comint jade impatient-mode helm-projectile helm-descbinds helm-company helm-c-yasnippet gotham-theme git-gutter expand-region exec-path-from-shell emmet-mode delight company-tern company-quickhelp browse-kill-ring ample-theme all-the-icons-dired ag ace-window ace-jump-mode))))

;;JUMP TO PERSONAL CONFIGURATION
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "conf.master")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
