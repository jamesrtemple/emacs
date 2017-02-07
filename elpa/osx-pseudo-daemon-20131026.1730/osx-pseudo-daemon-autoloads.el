;;; osx-pseudo-daemon-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "osx-pseudo-daemon" "osx-pseudo-daemon.el"
;;;;;;  (22681 14620 0 0))
;;; Generated autoloads from osx-pseudo-daemon.el

(let ((loads (get 'osx-pseudo-daemon 'custom-loads))) (if (member '"osx-pseudo-daemon" loads) nil (put 'osx-pseudo-daemon 'custom-loads (cons '"osx-pseudo-daemon" loads))))

(defvar osx-pseudo-daemon-mode (featurep 'ns) "\
Non-nil if Osx-Pseudo-Daemon mode is enabled.
See the `osx-pseudo-daemon-mode' command
for a description of this minor mode.")

(custom-autoload 'osx-pseudo-daemon-mode "osx-pseudo-daemon" nil)

(autoload 'osx-pseudo-daemon-mode "osx-pseudo-daemon" "\
Emulate daemon mode in OSX by hiding Emacs when you kill the last GUI frame.

On OSX, if you use Cocoa Emacs' daemon mode and then close all
GUI frames, the Emacs app on your dock becomes nonfunctional
until you open a new GUI frame using emacsclient on the command
line. This is obviously suboptimal. This package makes it so that
whenever you close the last GUI frame, a new frame is created and
the Emacs app is hidden, thus approximating the behvaior of
daemon mode while keeping the Emacs dock icon functional. To
actually quit instead of hiding Emacs, use CMD+Q (or Alt+Q if you
swapped Alt & Command keys).

This mode has no effect unless Emacs is running on OSX with the
Cocoa GUI, so it is safe to enable it unconditionally on all
platforms.

\(fn &optional ARG)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; osx-pseudo-daemon-autoloads.el ends here
