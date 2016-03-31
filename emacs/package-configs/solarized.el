(use-package solarized-theme
  :pin melpa
  :config (progn
    ;; Load theme
    (load-theme 'solarized-dark t)

    ;; Solarized - Unify fringe and line number background colour
    (add-hook 'after-make-frame-functions
      (lambda (frame)
        (select-frame frame)
        (if (display-graphic-p) (progn
          (set-face-attribute 'fringe frame
            :background (face-attribute 'default :background)
            :foreground (face-attribute 'fringe :foreground))
          (if (facep 'linum)
            (set-face-attribute 'linum frame
              :background (face-attribute 'default :background)
              :foreground (face-attribute 'linum :foreground) :slant 'normal)
          )
        ))
      )
    )
  )
)
