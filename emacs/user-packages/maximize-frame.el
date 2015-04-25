(defun my-maximize-frame ()
  "Maximize the current frame"
  (interactive)
  (set-frame-parameter nil 'fullscreen 'maximized)
  (set-frame-parameter nil 'top 0)
  (set-frame-parameter nil 'left 0)
)
