(require 'cl-lib)

(defconst normalize-indent-version "0.1.0")

(defgroup normalize-indent nil
  "Normalize indentation behaviors."
  :group 'emacs)

(defcustom normalize-indent-inhibit-modes '(dired-mode makefile-mode)
  "List of major-modes in which normalize-indent should be turned off."
  :type '(repeat symbol)
  :group 'normalize-indent)

(defun normalize-indent-indent-with-space ()
  (interactive)
  (insert "  "))

(defun normalize-indent-enter ()
  (interactive)
  (newline)
  (indent-relative-maybe))

(define-minor-mode normalize-indent-mode
  "Toggle normalized indentation mode"
  :init-value nil
  :lighter " N.Indent"
  :global nil
  (if normalize-indent-mode
    (progn
      (local-set-key "\t" 'normalize-indent-indent-with-space)
      (local-set-key (kbd "RET") 'normalize-indent-enter))
    (progn
      (local-unset-key "\t")
      (local-unset-key (kbd "RET")))))

(define-globalized-minor-mode normalize-indent-global-mode
  normalize-indent-mode
  (lambda ()
    (unless (cl-some 'derived-mode-p normalize-indent-inhibit-modes)
      (normalize-indent-mode 1))))

(provide 'normalize-indent)
