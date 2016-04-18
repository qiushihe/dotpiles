(require 'current-working-directory) ; See user-packages/current-working-directory.el

(setq neo-window-width 39)
(setq neo-persist-show nil)

(defun my-neotree-toggle ()
  (interactive)
  (let (
    (working-directory (cwd-get-frame-working-directory (selected-frame)))
  )
    (if working-directory
      (progn
        (neotree-toggle)
        (neo-buffer--change-root working-directory)
      )
      (neotree-toggle)
    )
  )
)

(bind-key* "C-c t t" 'my-neotree-toggle)
