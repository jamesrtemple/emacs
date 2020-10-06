(when (display-graphic-p)
  (use-package powerline
    :config
    (powerline-center-theme)

    ;; bar, box, brace, butt, chamfer, contour, curve, rounded,
    ;; roundstub, slant, wave, zigzag, nil
    (setq powerline-default-separator 'wave)
    (setq powerline-height 20)
    (setq powerline-raw " ")))
