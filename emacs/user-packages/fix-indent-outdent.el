;; My own un-refined approach to unify (in/put)dent behavior.

(defun my-normalize-region (rs re fn)
  (goto-char rs)
  (if (> rs (line-beginning-position))
    (my-normalize-region (line-beginning-position) re fn)
    (progn
      (goto-char re)
      (if (< re (line-end-position))
        (my-normalize-region rs (line-end-position) fn)
        (funcall fn rs re)
      )
    )
  )
)

(defun my-region-outdent (rs re)
  (goto-char rs)
  (if (<= (point) re)
    (progn
      (goto-char (line-beginning-position))
      (if (re-search-forward "^  " (line-end-position) t)
        (progn
          (replace-match "" nil t)
          (next-line 1)
          (my-region-outdent (point) (- re 2))
        )
        (if (re-search-forward "^ " (line-end-position) t)
          (progn
            (replace-match "" nil t)
            (next-line 1)
            (my-region-outdent (point) (- re 1))
          )
          (progn
            (next-line 1)
            (my-region-outdent (point) re)
          )
        )
      )
    )
  )
)

(defun my-region-indent (rs re)
  (goto-char rs)
  (if (<= (point) re)
    (progn
      (goto-char (line-beginning-position))
      (insert "  ")
      (next-line 1)
      (my-region-indent (point) (+ re 2))
    )
  )
)

;; TODO: This function (as well as 'my-outdent-region) needs to be smarter about deactivating the
;;       selection. Currently deactivate-mark is set to nil so that repeated (in/out)dent can be
;;       performed without having to re-select the region. However currently the mark is silently
;;       left in place and need to be manually deactivated (C-space) otherwise unexpected behaviors
;;       may happen.
(defun my-outdent-region ()
  (interactive)
  (save-excursion
	  (if (< (point) (mark)) (exchange-point-and-mark))
    (my-normalize-region (mark) (point) 'my-region-outdent)
  )
  (setq deactivate-mark nil)
)

(defun my-indent-region ()
  (interactive)
  (save-excursion
    (if (< (point) (mark)) (exchange-point-and-mark))
    (my-normalize-region (mark) (point) 'my-region-indent)
  )
  (setq deactivate-mark nil)
)

(global-set-key (kbd "C-{") 'my-outdent-region)
(global-set-key (kbd "C-}") 'my-indent-region)
