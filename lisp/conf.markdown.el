 ;;MARKDOWN MODE
(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(setq markdown-command "pandoc -f markdown_github")
(setq markdown-open-command "/usr/local/bin/mark")
(setq markdown-header-scaling 1)

(setq my-primary "#497681")
(setq my-primary-light "#89298")
(setq my-primary-lightmed "#497681")
(setq my-primary-darkmed "#0B4552")
(setq my-primary-dark "#01303B")

(setq my-secondary "#AA8739")
(setq my-secondary-light "#F5E5C0")
(setq my-secondary-lightmed "#D0B474")
(setq my-secondary-darkmed "#84600F")
(setq my-secondary-dark "#5F4200")

(setq my-tertiary "#AA4639")
(setq my-tertiary-light "#F5C6C0")
(setq my-tertiary-lightmed "#D07F74")
(setq my-tertiary-darkmed "#841D0F")
(setq my-tertiary-dark "#5F0B00")


(set-face-attribute 'markdown-header-delimiter-face nil
                    :height 1.0
                    :foreground my-primary
                    :weight 'light)

(set-face-attribute 'markdown-header-rule-face nil
                    :height 1.0
                    :foreground my-primary
                    :weight 'light)

(set-face-attribute 'markdown-header-face nil
		    :inherit markdown-header-face
		    :height 1.0
                    :foreground my-primary
		    :weight 'light)

(set-face-attribute 'markdown-header-face-1 nil
		    :height 2.0
                    :weight 'ultra-bold
                    :width 'ultra-expanded
                    :underline 'nil
                    :foreground my-secondary
		    :inherit markdown-header-face)

(set-face-attribute 'markdown-header-face-2 nil
		    :height 1.4
                    :width 'normal
                    :width 'ultra-expanded
                    :underline 'nil
                    :foreground my-secondary-darkmed
		    :inherit markdown-header-face)

(set-face-attribute 'markdown-header-face-3 nil
		    :height 1.2
                    :width 'normal
                    :width 'ultra-expanded
                    :foreground my-secondary-lightmed
		    :inherit markdown-header-face)

(set-face-attribute 'markdown-header-face-4 nil
		    :height 1.2
                    :width 'normal
                    :width 'ultra-expanded
                    :foreground my-secondary-light
		    :inherit markdown-header-face)

(set-face-attribute 'markdown-code-face nil
		    :height 1.0
                    :width 'condensed
		    :inherit 'markdown-code-face)

(set-face-attribute 'markdown-bold-face nil
                    :height 1.0
                    :foreground my-tertiary
                    :weight 'bold)

(set-face-attribute 'markdown-italic-face nil
                    :height 1.0
                    :foreground my-tertiary-lightmed
                    :weight 'light)

(set-face-attribute 'markdown-list-face nil
                    :height 1.0
                    :foreground my-tertiary-lightmed
                    :weight 'light)

(set-face-attribute 'markdown-blockquote-face nil
                    :height 1.0
                    :foreground my-primary
                    :weight 'light)

(set-face-attribute 'markdown-pre-face nil
                    :height 1.0
                    :foreground my-primary-light
                    :weight 'light)

(set-face-attribute 'markdown-table-face nil
                    :height 1.0
                    :foreground my-primary-light
                    :weight 'light)


(add-hook 'markdown-mode-hook 'flyspell-mode 1)

;;PANDOC
(load "pandoc-mode")
(add-hook 'markdown-mode-hook 'pandoc-mode)
