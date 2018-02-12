(when (display-graphic-p)
  (use-package powerline
    :config
    (powerline-default-theme)
    
    ;; bar, box, brace, butt, chamfer, contour, curve, rounded,
    ;; roundstub, slant, wave, zigzag, nil
    (setq powerline-default-separator 'bar)
    (setq powerline-height 16)
    (setq powerline-raw " ")))
