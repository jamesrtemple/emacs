;;Setup preferred theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'custom-theme-load-path "~/.emacs.d/colorthemes")
(if (display-graphic-p)
  (require 'color-theme-sanityinc-tomorrow)
  (color-theme-sanityinc-tomorrow-night)
)
