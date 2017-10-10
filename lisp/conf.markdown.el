 ;;MARKDOWN MODE
(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(setq markdown-command "pandoc")
(setq markdown-header-scaling 1)

(set-face-attribute 'markdown-header-face nil
		    :inherit markdown-header-face
		    :family "Averia-sans"
		    :height 1.4
		    :foreground "sienna4"
		    :weight 'light)

(set-face-attribute 'markdown-header-face-1 nil
		    :height 1.4
                    :foreground "sienna3"
                    :weight 'medium
                    :width 'condensed
		    :inherit markdown-header-face)

(set-face-attribute 'markdown-header-face-2 nil
		    :height 1.0
                    :foreground "sienna3"
                    :width 'condensed
		    :inherit markdown-header-face)

(set-face-attribute 'markdown-header-face-3 nil
		    :height 0.8
                    :width 'condensed
   		    :foreground "sienna2")

(set-face-attribute 'markdown-header-face-4 nil
		    :height 0.8
                    :width 'condensed
		    :inherit markdown-header-face
       		    :foreground "sienna2")

(add-hook 'markdown-mode-hook 'flyspell-mode 1)

;;PANDOC
(load "pandoc-mode")
(add-hook 'markdown-mode-hook 'pandoc-mode)
