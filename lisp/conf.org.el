;;ORG MODE
(require 'org)
(setq org-startup-with-inline-images t)
(setq org-startup-indented t)
(setq org-return-follows-link t)
(setq org-tags-column 70)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(add-hook 'org-mode-hook 'flyspell-mode 1)

(setq org-link-frame-setup (quote ((vm . vm-visit-folder-other-frame)
               (vm-imap . vm-visit-imap-folder-other-frame)
               (gnus . org-gnus-no-new-news)
               (file . find-file)
               (wl . wl-other-frame))))

(set-face-attribute 'org-level-1 nil
                    :height 1.2
                    :box nil
                    :background nil)

(set-face-attribute 'org-level-2 nil
                    :height 1.0
                    :box nil
                    :background nil)

