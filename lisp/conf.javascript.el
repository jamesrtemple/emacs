;;JAVASCRIPT
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(yas-reload-all)
(add-hook 'js2-mode-hook 'yas-minor-mode)

(require 'flycheck)
(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(add-hook 'js2-mode-hook 'myJs2ModeHook)

(defun myJs2ModeHook()
  (company-tern t)
  (flycheck-mode t)
  (tern-mode t))
;;END JAVASCRIPT
