 ;;MARKDOWN MODE
(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(setq markdown-command "pandoc -f markdown_github")
(setq markdown-open-command "/usr/local/bin/mark")
(setq markdown-header-scaling 1)

(set-face-attribute 'markdown-header-delimiter-face nil
                    :height 1.0
                    :foreground "medium sea green"
                    :weight 'light)

(set-face-attribute 'markdown-header-rule-face nil
                    :height 1.0
                    :foreground "medium sea green"
                    :weight 'light)

(set-face-attribute 'markdown-header-face nil
		    :inherit markdown-header-face
		    :height 1.2
                    :foreground "medium sea green"
		    :weight 'light)

(set-face-attribute 'markdown-header-face-1 nil
		    :height 1.4
                    :weight 'medium
                    :width 'condensed
		    :inherit markdown-header-face)

(set-face-attribute 'markdown-header-face-2 nil
		    :height 1.2
                    :width 'condensed
		    :inherit markdown-header-face)

(set-face-attribute 'markdown-header-face-3 nil
		    :height 1.0
                    :foreground "sea green"
                    :width 'condensed)

(set-face-attribute 'markdown-header-face-4 nil
		    :height 1.0
                    :width 'condensed
		    :inherit markdown-header-face)

(set-face-attribute 'markdown-code-face nil
		    :height 1.0
                    :width 'condensed
		    :inherit 'markdown-code-face)

(set-face-attribute 'markdown-bold-face nil
                    :height 1.0
                    :foreground "LightGoldenrod3"
                    :weight 'light)

(set-face-attribute 'markdown-italic-face nil
                    :height 1.0
                    :foreground "LightGoldenrod2"
                    :weight 'light)


(add-hook 'markdown-mode-hook 'flyspell-mode 1)

;;PANDOC
(load "pandoc-mode")
(add-hook 'markdown-mode-hook 'pandoc-mode)
