;;PROJECTILE
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-indexing-method 'alien)

(dolist (item '("node_modules"))
  (add-to-list 'projectile-globally-ignored-directories item))
