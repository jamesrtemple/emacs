;;MARKDOWN MODE
(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(setq markdown-command "/usr/local/bin/pandoc")
(set-face-attribute 'markdown-header-face nil
		    :inherit markdown-header-face
		    :height 2.0
		    :family "Baskerville"
		    :foreground "orange2")
(set-face-attribute 'markdown-header-face-1 nil
		    :inherit markdown-header-face
		    :height 2.0)
(set-face-attribute 'markdown-header-face-2 nil
		    :inherit markdown-header-face
		    :height 1.5)
(set-face-attribute 'markdown-header-face-3 nil
		    :height 1.0
   		    :foreground "orange3")
(set-face-attribute 'markdown-header-face-4 nil
		    :inherit markdown-header-face
		    :height 1.0)
(add-hook 'markdown-mode-hook 'flyspell-mode 1)


;;PANDOC
(load "pandoc-mode")
(add-hook 'markdown-mode-hook 'pandoc-mode)
