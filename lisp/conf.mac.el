;;MAC SPECIFIC SETTINGS
(if (eq system-type 'darwin)
    (progn
       (setenv "PATH" (concat "/usr/local/bin:/usr/local/sbin:" (getenv "PATH")))
       (setq exec-path (append exec-path '("/usr/local/bin")))
       (set-frame-font "Inconsolata-16")
       (setq-default line-spacing 0.0)
       (setq ns-use-srgb-colorspace nil)
       (set-terminal-coding-system 'utf-8)
       (set-keyboard-coding-system 'utf-8)
       (setq default-directory (concat (getenv "HOME") "/"))
       (prefer-coding-system 'utf-8)))
