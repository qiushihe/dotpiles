(use-package neotree
  :config
  (progn
    (setq neo-window-width 39)
    (setq neo-persist-show nil)

    (defun my-neo-buffer--valid-start-node-p (orig-fun &rest args)
      "Advice for neotree start node validator.
      Override return value to nil is projectile is present. This way it will force neotree
      to always call neo-path--get-working-dir whenever it's about to open the neotree window.
      If projectile if not present, return the return value of the original
      neo-buffer--valid-start-node-p instead."
      (if (fboundp 'projectile-project-root)
        nil
        (apply orig-fun args)
      )
    )
    (advice-add 'neo-buffer--valid-start-node-p :around #'my-neo-buffer--valid-start-node-p)

    (defun my-neo-path--get-working-dir (orig-fun &rest args)
      "Advice for neotree working directory getter.
      Override to return the same value as projectile-project-root if and only if
      projectile-project-root actually returns anything. If projectile-project-root returns error
      then return the return value of the original neo-path--get-working-dir instead."
      (if (fboundp 'projectile-project-root)
        (let (
          (project-root (ignore-errors (projectile-project-root)))
        ) (progn
          (if project-root project-root (apply orig-fun args))
        ))
        (apply orig-fun args)
      )
    )
    (advice-add 'neo-path--get-working-dir :around #'my-neo-path--get-working-dir)

    ;; Update neotree window (if it's opened) when projectile switches project
    (defun my-update-neotree-dir ()
      (interactive)
      (if (and
        (fboundp 'neo-global--window-exists-p)
        (fboundp 'neo-global--open-dir)
      ) (progn
        (if (neo-global--window-exists-p)
          (progn
            (neo-global--open-dir (projectile-project-root))
            (other-window -1) ; Refocus previous window
          )
        )
      ))
    )
    (add-hook 'projectile-after-switch-project-hook 'my-update-neotree-dir)
  )
  :bind
  (
    ("C-c t t" . neotree-toggle)
  )
)
