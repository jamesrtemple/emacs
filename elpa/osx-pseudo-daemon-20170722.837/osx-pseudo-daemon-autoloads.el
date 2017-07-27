;;; osx-pseudo-daemon-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "mac-pseudo-daemon" "mac-pseudo-daemon.el"
;;;;;;  (22905 58435 0 0))
;;; Generated autoloads from mac-pseudo-daemon.el

(defvar macpd-mac-frame-types '(ns mac) "\
Set of frame types considered to be Mac GUI frames.")

(defvar macpd-mac-gui-features '(ns mac) "\
Set of features indicating Emacs is running a Mac GUI.")

(cl-loop for feature in macpd-mac-gui-features do (require feature nil 'noerror))

(let ((loads (get 'mac-pseudo-daemon 'custom-loads))) (if (member '"mac-pseudo-daemon" loads) nil (put 'mac-pseudo-daemon 'custom-loads (cons '"mac-pseudo-daemon" loads))))

(defvar mac-pseudo-daemon-mode nil "\
Non-nil if Mac-Pseudo-Daemon mode is enabled.
See the `mac-pseudo-daemon-mode' command
for a description of this minor mode.")

(custom-autoload 'mac-pseudo-daemon-mode "mac-pseudo-daemon" nil)

(autoload 'mac-pseudo-daemon-mode "mac-pseudo-daemon" "\
Hide Emacs instead of quitting when you kill the last frame on Mac OS.

On Mac OS, if you use Cocoa Emacs' real daemon mode and then
close all GUI frames, the Emacs app on your dock becomes
nonfunctional until you open a new GUI frame using emacsclient on
the command line. This is obviously suboptimal. This package
implements a fake daemon mode by making it so that whenever you
close the last GUI frame, a new frame is created and the Emacs
app is hidden (like pressing Cmd+H), thus approximating the
behvaior of daemon mode while keeping the Emacs dock icon
functional. This also approximates the behavior of document-based
Mac applications, which can stay open even though there is no
window.

To actually quit Emacs instead of hiding it, use Cmd+Q (or
Option+Q if you swapped the Option & Command keys).

This mode has no effect unless Emacs is running on Mac OS, so if
you have an Emacs config that is shared among multiple operating
systems, it is safe to enable this mode unconditionally.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("osx-pseudo-daemon-pkg.el" "osx-pseudo-daemon.el")
;;;;;;  (22905 58435 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; osx-pseudo-daemon-autoloads.el ends here
