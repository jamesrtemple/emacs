;;YASNIPPET
;;  Loaded before auto complete so that they can work together
(require 'yasnippet)
(setq yas-snippet-dirs "~/.emacs.d/snippets")


;;COMPANY
(require 'company)
(add-to-list 'company-backends 'company-tern)
(global-company-mode)
(company-quickhelp-mode 1)

(require 'company-css)

;; ;; Add yasnippet support for all company backends
;; ;; https://github.com/syl20bnr/spacemacs/pull/179
;; (defun autocomplete-show-snippets ()
;;   "Show snippets in autocomplete popup."
;;   (let ((backend (car company-backends)))
;;     (unless (listp backend)
;;       (setcar company-backends `(,backend :with company-yasnippet company-files)))))

;; ;; See http://www.gnu.org/software/emacs/manual/html_node/emacs/Hooks.html
;; ;; for what this line means
;; (add-hook 'after-change-major-mode-hook 'autocomplete-show-snippets)


;; Completing point by some yasnippet key
(defun yas-ido-expand ()
  "Lets you select (and expand) a yasnippet key"
  (interactive)
    (let ((original-point (point)))
      (while (and
              (not (= (point) (point-min) ))
              (not
               (string-match "[[:space:]\n]" (char-to-string (char-before)))))
        (backward-word 1))
    (let* ((init-word (point))
           (word (buffer-substring init-word original-point))
           (list (yas-active-keys)))
      (goto-char original-point)
      (let ((key (remove-if-not
                  (lambda (s) (string-match (concat "^" word) s)) list)))
        (if (= (length key) 1)
            (setq key (pop key))
          (setq key (ido-completing-read "key: " list nil nil word)))
        (delete-char (- init-word original-point))
        (insert key)
        (yas-expand)))))

