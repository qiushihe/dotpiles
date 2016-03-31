(use-package git-gutter
  :pin melpa
  :config
  (progn
    (global-git-gutter-mode t)
    (git-gutter:linum-setup)

    (custom-set-variables '(git-gutter:hide-gutter t))
    (custom-set-variables '(git-gutter:ask-p nil))
    (custom-set-variables '(git-gutter:verbosity 0))

    (add-hook 'after-change-major-mode-hook (lambda ()
      (if (facep 'linum)
        (let ((linum-bg (face-attribute 'linum :background)))
          (progn
            (set-face-background 'git-gutter:added linum-bg)
            (set-face-background 'git-gutter:modified linum-bg)
            (set-face-background 'git-gutter:deleted linum-bg)
            (set-face-foreground 'git-gutter:added "green")
            (set-face-foreground 'git-gutter:modified "orange")
            (set-face-foreground 'git-gutter:deleted "red")
          )
        )
      )
    ))
  )
)
