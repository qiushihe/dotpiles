(projectile-global-mode)
(setq projectile-enable-caching t)

;; Advice projectile-root-bottom-up to short circuit and return the value
;; of 'working-directory frame variable, defined by the emacsl script.
;; This gets around the issue of projectile incorrectly assuming submodule
;; root to be project root when inside a submodule in a project.
;; This method of advising projectile-root-bottom-up allows dynamic project
;; detection without having to create the .projectile file.
(defun my-projectile-root-bottom-up (orig-fun &rest args)
  (if (boundp 'working-directory)
    (if (string= (substring working-directory -1) "/")
      working-directory
      (concat working-directory "/")
    )
    (apply orig-fun args)
  )
)
(advice-add 'projectile-root-bottom-up :around #'my-projectile-root-bottom-up)

;; Advice for projectile-switch-project-by-name to update the 'working-directory frame variable
(defun my-projectile-switch-project-by-name (orig-fun &rest args)
  (let (
    (project-to-switch (car args))
  )
    (modify-frame-parameters nil (list (cons 'working-directory project-to-switch)))
  )
  (apply orig-fun args)
)
(advice-add 'projectile-switch-project-by-name :around #'my-projectile-switch-project-by-name)
