;;Setup preferred theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'custom-theme-load-path "~/.emacs.d/colorthemes")

(load-theme 'ample t t)
;;(load-theme 'ample-flat t t)
;;(load-theme 'ample-light t t)

;; choose one to enable
(enable-theme 'ample)
;;(enable-theme 'ample-flat)
;;(enable-theme 'ample-light)


;; (if (display-graphic-p)
;;   (require 'color-theme-sanityinc-tomorrow)
;;   (color-theme-sanityinc-tomorrow-day)
;; )

