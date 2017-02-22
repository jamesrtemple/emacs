(require 'powerline)
;;(powerline-center-theme)
;;(setq powerline-default-separator 'bar)

(use-package spaceline-all-the-icons :after spaceline)

(use-package spaceline :after powerline
  :config (setq-default mode-line-format '("%e" (:eval (spaceline-ml-ati)))))
