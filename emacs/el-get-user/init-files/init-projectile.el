(require 'current-working-directory) ; See user-packages/current-working-directory.el

(projectile-global-mode)
(setq projectile-enable-caching t)

(add-hook 'after-change-major-mode-hook (lambda ()
  (require 'helm-projectile) ; Require so we can call helm-projectile-toggle
  ;; Call helm-projectile-toggle instead of helm-projectile-on to avoid the annoying message
  (helm-projectile-toggle 1)
))

;; Advice projectile-root-bottom-up to short circuit and return the value
;; of 'working-directory frame variable, defined by the emacsl script.
;; This gets around the issue of projectile incorrectly assuming submodule
;; root to be project root when inside a submodule in a project.
;; This method of advising projectile-root-bottom-up allows dynamic project
;; detection without having to create the .projectile file.
;;
;; TODO: Improve submodule detection with http://stackoverflow.com/a/7363338
(defun my-projectile-root-bottom-up (orig-fun &rest args)
  (let (
    (working-directory (cwd-get-frame-working-directory (selected-frame)))
  )
    (if working-directory
      (if (string= (substring working-directory -1) "/")
        working-directory
        (concat working-directory "/")
      )
      (apply orig-fun args)
    )
  )
)
(advice-add 'projectile-root-bottom-up :around #'my-projectile-root-bottom-up)

;; Advice for projectile-switch-project-by-name to update the frame working directory variable
(defun my-projectile-switch-project-by-name (orig-fun &rest args)
  (let (
    (project-to-switch (car args))
  )
    (cwd-set-frame-working-directory (selected-frame) project-to-switch)
  )
  (apply orig-fun args)
)
(advice-add 'projectile-switch-project-by-name :around #'my-projectile-switch-project-by-name)
