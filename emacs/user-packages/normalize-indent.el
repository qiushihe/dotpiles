(require 'cl-lib)

(defconst normalize-indent-version "0.2.0")

(defgroup normalize-indent nil
  "Normalize indentation behaviors."
  :group 'emacs)

(defcustom normalize-indent-inhibit-modes '(dired-mode makefile-mode)
  "List of major-modes in which normalize-indent should be turned off."
  :type '(repeat symbol)
  :group 'normalize-indent)

(defun normalize-indent-indent-line ()
  "If indent-tabs-mode and tab-width are set (i.e. via editorconfig), then insert either \t (as
  indicated by indent-tabs-mode), or a certain number of spaces (according to tab-width). May be
  bound to TAB."
  (interactive)
  (if (boundp 'indent-tabs-mode)
    (if indent-tabs-mode
      (insert "\t")
      (if (boundp 'tab-width)
        (if (> tab-width 0)
          (insert (make-string tab-width ?\s))
          (indent-relative nil)
        )
        (indent-relative nil)
      )
    )
    (indent-relative nil)
  )
)

(defun normalize-indent-enter ()
  "Simplified line-break bahaviour. May be bound to ENTER."
  (interactive)
  ;(looking-back "^\\( +\\).*")
  ;(newline)
  ;(insert (match-string 1))
  (newline)
  (indent-relative-maybe)
)

(define-minor-mode normalize-indent-mode
  "Toggle normalized indentation mode"
  :init-value nil
  :lighter " nIndent"
  :global nil
  (if normalize-indent-mode
    (progn
      (local-set-key "\t" 'normalize-indent-indent-line)
      (local-set-key (kbd "RET") 'normalize-indent-enter)
    )
    (progn
      (local-unset-key "\t")
      (local-unset-key (kbd "RET"))
    )
  )
)

;; Define normalize-indent minor mode
(define-globalized-minor-mode normalize-indent-global-mode
  normalize-indent-mode
  (lambda ()
    (unless (cl-some 'derived-mode-p normalize-indent-inhibit-modes)
      (normalize-indent-mode 1))))

(provide 'normalize-indent)
