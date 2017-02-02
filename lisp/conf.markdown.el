;;MARKDOWN MODE
(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(setq markdown-command "/usr/local/bin/markdown")
(setq markdown-header-scaling 1)

(set-face-attribute 'markdown-header-face nil
		    :inherit markdown-header-face
		    :family "Baskerville"
		    :height 2.0
		    :foreground "orange2")
(set-face-attribute 'markdown-header-face-1 nil
		    :height 2.0
		    :inherit markdown-header-face)
(set-face-attribute 'markdown-header-face-2 nil
		    :height 1.6
		    :inherit markdown-header-face)
(set-face-attribute 'markdown-header-face-3 nil
		    :height 1.2
   		    :foreground "orange3")
(set-face-attribute 'markdown-header-face-4 nil
		    :height 1.0
		    :inherit markdown-header-face
       		    :foreground "orange3")
(add-hook 'markdown-mode-hook 'flyspell-mode 1)


;;PANDOC
(load "pandoc-mode")
(add-hook 'markdown-mode-hook 'pandoc-mode)
