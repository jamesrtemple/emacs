;;; control-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "control-mode" "control-mode.el" (22150 8945
;;;;;;  0 0))
;;; Generated autoloads from control-mode.el

(autoload 'control-mode "control-mode" "\
Toggle Control mode.
With a prefix argument ARG, enable Control mode if ARG
is positive, and disable it otherwise.  If called from Lisp,
enable the mode if ARG is omitted or nil.

Control mode is a global minor mode.

\(fn &optional ARG)" t nil)

(defvar global-control-mode nil "\
Non-nil if Global-Control mode is enabled.
See the command `global-control-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-control-mode'.")

(custom-autoload 'global-control-mode "control-mode" nil)

(autoload 'global-control-mode "control-mode" "\
Toggle Control mode in all buffers.
With prefix ARG, enable Global-Control mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Control mode is enabled in all buffers where
`control-mode' would do it.
See `control-mode' for more information on Control mode.

\(fn &optional ARG)" t nil)

(autoload 'control-mode-default-setup "control-mode" "\


\(fn)" nil nil)

(autoload 'control-mode-localized-setup "control-mode" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil nil ("control-mode-pkg.el") (22150 8945 158303
;;;;;;  0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; control-mode-autoloads.el ends here
