;; Set page guide at 100 columns
(add-hook 'after-change-major-mode-hook (lambda ()
  (interactive)
  (column-marker-3 100)))
