;; Set page guide at 100 columns
(add-hook 'after-change-major-mode-hook (lambda ()
  (interactive)
  (column-marker-3 100)))

;; Use foreground colour instead of background colour so the column
;; highlight will work with global-hi-mode
(add-hook 'after-make-frame-functions
  (lambda (frame)
    (select-frame frame)
    (set-face-attribute 'column-marker-3 nil
      :background (face-attribute 'default :background)
      :foreground "dark red")))
