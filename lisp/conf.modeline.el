(require 'powerline)
(powerline-center-theme)

(setq powerline-default-separator 'slant)
(setq powerline-raw " ")
(setq ns-use-srgb-colorspace nil)

(set-face-attribute 'mode-line nil
                    :foreground "Black"
                    :background "DodgerBlue4")


(require 'dim)
(dim-minor-name 'yas-minor-mode "")
(dim-minor-name 'helm-mode "")
(dim-minor-name 'org-indent-mode "")
(dim-minor-name 'company-mode "")
(dim-minor-name 'helm--minor-mode "")
(dim-minor-name 'tide-mode "")
(dim-minor-name 'git-gutter-mode "")
(dim-minor-name 'eldoc-mode "")
