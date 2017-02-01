;;MAC SPECIFIC SETTINGS
(if (eq system-type 'darwin)
    (progn
       (setenv "PATH" (concat "/usr/local/bin:/usr/local/sbin:" (getenv "PATH")))
       (setq exec-path (append exec-path '("/usr/local/bin")))
       (setq mac-command-modifier 'control)
       (set-terminal-coding-system 'utf-8)
       (set-keyboard-coding-system 'utf-8)
       (setq mac-command-modifier 'control)
       (setq mac-option-modifier 'meta)
       (setq mac-control-modifier 'super)
       (prefer-coding-system 'utf-8)))
