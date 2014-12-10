;; My own un-refined approach to unify (in/put)dent behavior.

(defun my-normalize-region (rs re fn)
  (goto-char rs)
  (if (> rs (line-beginning-position))
      (my-normalize-region (line-beginning-position) re fn)
      (and (goto-char re)
           (if (< re (line-end-position))
               (my-normalize-region rs (line-end-position) fn)
               (funcall fn rs re)))))

(defun my-region-outdent (rs re)
  (goto-char rs)
  (while (<= (point) re)
         (goto-char (line-beginning-position))
         (if (re-search-forward "^  " (line-end-position) t)
             (replace-match "" nil t)
             (if (re-search-forward "^ " (line-end-position) t)
                 (replace-match "" nil t)))
         (next-line 1)))

;; TODO: This function has a bug in that if the selection doesn't go beyond the end if line for the
;;       last line in selection, the two spaces wont be insert to the last line. However if the two
;;       spaces were replaced with some other characters (i.e. "++") then they would be inserted.
(defun my-region-indent (rs re)
  (goto-char rs)
  (while (<= (point) re)
         (goto-char (line-beginning-position))
         (insert "  ")
         (next-line 1)))

;; TODO: This function (as well as 'my-outdent-region) needs to be smarter about deactivating the
;;       selection. Currently deactivate-mark is set to nil so that repeated (in/out)dent can be
;;       performed without having to re-select the region. However currently the mark is silently
;;       left in place and need to be manually deactivated (C-space) otherwise unexpected behaviors
;;       may happen.
(defun my-outdent-region ()
  (interactive)
  (save-excursion
	  (if (< (point) (mark)) (exchange-point-and-mark))
    (my-normalize-region (mark) (point) 'my-region-outdent))
  (setq deactivate-mark nil))

(defun my-indent-region ()
  (interactive)
  (save-excursion
    (if (< (point) (mark)) (exchange-point-and-mark))
    (my-normalize-region (mark) (point) 'my-region-indent))
  (setq deactivate-mark nil))

(global-set-key (kbd "C-{") 'my-outdent-region)
(global-set-key (kbd "C-}") 'my-indent-region)
