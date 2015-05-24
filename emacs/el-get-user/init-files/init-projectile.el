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
