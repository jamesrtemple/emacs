;;JAVASCRIPT
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(yas-reload-all)
(add-hook 'js2-mode-hook 'yas-minor-mode)

(setq js-switch-indent-offset 8)

(setq-default js2-basic-offset 2)


(require 'flycheck)
(add-hook 'js2-mode-hook 'myJs2ModeHook)

(defun myJs2ModeHook()
  (company-tern t)
  (flycheck-mode t)
  (tern-mode t))

