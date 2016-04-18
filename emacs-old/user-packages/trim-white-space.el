;; Remove extra whitespace on save
(defun delete-trailing-whitespace-and-blank-lines ()
  (interactive)
  (let ((point (point)))
    (delete-trailing-whitespace)
    (goto-char (point-max))
    (delete-blank-lines)
    (goto-char (min point (point-max)))))

(add-hook 'before-save-hook 'delete-trailing-whitespace-and-blank-lines)
