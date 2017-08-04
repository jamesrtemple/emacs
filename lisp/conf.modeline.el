(require 'powerline)
(powerline-center-theme)

(setq powerline-default-separator 'curve)
(setq powerline-raw " ")
(setq ns-use-srgb-colorspace nil)

(set-face-attribute 'mode-line nil
                    :foreground "Black"
                    :background "DarkOrange4")

(require 'dim)
(dim-minor-name 'yas-minor-mode "")
(dim-minor-name 'helm-mode "")
(dim-minor-name 'org-indent-mode "")
