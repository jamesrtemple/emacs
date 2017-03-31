;;NEOTREE

(require 'neotree)
(require 'all-the-icons)

;; every time when the neotree window is  opened, it will try to find current
;; file and jump to node.
(setq-default neo-smart-open nil)

;; change root automatically when running `projectile-switch-project`
(setq projectile-switch-project-action 'neotree-projectile-action)

(global-set-key [f8] 'neotree-toggle)

;;(setq neo-theme (if window-system 'icons 'nerd)) ; 'classic, 'nerd, 'ascii, 'arrow
(setq neo-theme 'nerd) ; 'classic, 'nerd, 'ascii, 'arrow

(setq neo-vc-integration '(face char))

(setq neo-toggle-window-keep-p t)

(setq neo-force-change-root t)

;;(add-hook 'neotree-mode-hook (lambda () (setq-local mode-line-format nil)))

;; face customizations

(set-face-attribute 'neo-vc-edited-face nil
                    :foreground "#E2C08D")

(set-face-attribute 'neo-vc-added-face nil
                    :foreground "green4")

(setq neo-window-width 50)

(setq neo-window-fixed-size nil)
