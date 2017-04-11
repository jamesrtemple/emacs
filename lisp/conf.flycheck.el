;; Make flycheck popup on the bottom of the screen

(add-hook 'after-init-hook #'global-flycheck-mode)

(add-to-list 'display-buffer-alist
             `(,(rx bos "*Flycheck errors*" eos)
              (display-buffer-reuse-window
               display-buffer-in-side-window)
              (side            . bottom)
              (reusable-frames . visible)
              (window-height   . 0.33)))

;;(with-eval-after-load 'flycheck
;;  (flycheck-pos-tip-mode))

(setq flycheck-highlighting-mode 'lines)
(setq flycheck-indication-mode 'left-fringe)
