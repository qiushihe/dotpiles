(setq neo-window-width 39)
(setq neo-persist-show nil)

(defun my-neotree-toggle ()
  (interactive)
  (if (boundp 'working-directory)
    (progn
      (neotree-toggle)
      (neo-buffer--change-root working-directory)
    )
    (progn
      (neotree-toggle)
    )
  )
)

(bind-key* "C-c t t" 'my-neotree-toggle)
