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

(defun normalize-indent-normalize-region (rs re fn)
  (goto-char rs)
  (if (> rs (line-beginning-position))
    (normalize-indent-normalize-region (line-beginning-position) re fn)
    (progn
      (goto-char re)
      (if (< re (line-end-position))
        (normalize-indent-normalize-region rs (line-end-position) fn)
        (funcall fn rs re)))))

(defun normalize-indent-outdent-region-r (rs re)
  (goto-char rs)
  (if (<= (point) re)
    (progn
      (goto-char (line-beginning-position))
      (if (re-search-forward "^  " (line-end-position) t)
        (progn
          (replace-match "" nil t)
          (next-line 1)
          (normalize-indent-outdent-region-r (point) (- re 2)))
        (if (re-search-forward "^ " (line-end-position) t)
          (progn
            (replace-match "" nil t)
            (next-line 1)
            (normalize-indent-outdent-region-r (point) (- re 1)))
          (progn
            (next-line 1)
            (normalize-indent-outdent-region-r (point) re)))))))

(defun normalize-indent-indent-region-r (rs re)
  (goto-char rs)
  (if (<= (point) re)
    (progn
      (goto-char (line-beginning-position))
      (insert "  ")
      (next-line 1)
      (normalize-indent-indent-region-r (point) (+ re 2)))))

(defun normalize-indent-outdent-region ()
  (interactive)
  (save-excursion
	  (if (< (point) (mark)) (exchange-point-and-mark))
    (normalize-indent-normalize-region (mark) (point) 'normalize-indent-outdent-region-r))
  (setq deactivate-mark nil))

(defun normalize-indent-indent-region ()
  (interactive)
  (save-excursion
    (if (< (point) (mark)) (exchange-point-and-mark))
    (normalize-indent-normalize-region (mark) (point) 'normalize-indent-indent-region-r))
  (setq deactivate-mark nil))

(define-minor-mode normalize-indent-mode
  "Toggle normalized indentation mode"
  :init-value nil
  :lighter " NIndent"
  :global nil
  (if normalize-indent-mode
    (progn
      (local-set-key "\t" 'normalize-indent-indent-with-space)
      (local-set-key (kbd "RET") 'normalize-indent-enter)
      (local-set-key (kbd "C-{") 'normalize-indent-outdent-region)
      (local-set-key (kbd "C-}") 'normalize-indent-indent-region))
    (progn
      (local-unset-key "\t")
      (local-unset-key (kbd "RET"))
      (local-unset-key (kbd "C-{"))
      (local-unset-key (kbd "C-}")))))

(define-globalized-minor-mode normalize-indent-global-mode
  normalize-indent-mode
  (lambda ()
    (unless (cl-some 'derived-mode-p normalize-indent-inhibit-modes)
      (normalize-indent-mode 1))))

(provide 'normalize-indent)
