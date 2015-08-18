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
;; TODO: Improve submodule detection with:
;; if (cd ~/Projects/cart-checkout/atlas-common/frontend && cd "$(git rev-parse --show-toplevel 2> /dev/null)/.." && git rev-parse --is-inside-work-tree 2> /dev/null) | grep -q true; then echo "yes"; else echo "no"; fi
;; if (cd ~/Downloads && git rev-parse --is-inside-work-tree 2> /dev/null) | grep -q true; then echo "yes"; else echo "no"; fi
(defun my-projectile-path-is-git-repo (path)
  "Determine if the given path is for/inside a git repo."
  (shell-command-to-string (format
    "if (cd %s 2> /dev/null && git rev-parse --is-inside-work-tree 2> /dev/null) | grep -q true; then printf 1; fi"
    path
  ))
)

(defun my-projectile-path-is-git-submodule (path)
  "Determine if the given path is for/inside a git submodule."
  (shell-command-to-string (format
    "if (cd %s 2> /dev/null && cd \"$(git rev-parse --show-toplevel 2> /dev/null)/..\" && git rev-parse --is-inside-work-tree 2> /dev/null) | grep -q true; then printf 1; fi"
    path
  ))
)

(defun my-projectile-path-parent-path (path)
  "Return the path for the parent directory of the given path. The returned path is without trailing slash."
  (replace-regexp-in-string "/[^/]+/?$" "" path)
)

(defun my-projectile-path-with-trailing-slash (path)
  "Return the given path with trialing slash, if the given path doesn't already have a trailing slash."
  (if (string= (substring path -1) "/") path (concat path "/"))
)

(defun my-projectile-root-bottom-up (orig-fun &rest args)
  "Advice for projectile root bottom-up searching function to work around an issue with git submodule detection."
  (let (
    (working-directory (cwd-get-frame-working-directory (selected-frame)))
  )
    (if working-directory
      (my-projectile-path-with-trailing-slash working-directory)
      (apply orig-fun args)
    )
  )
)
(advice-add 'projectile-root-bottom-up :around #'my-projectile-root-bottom-up)

(defun my-projectile-switch-project-by-name (orig-fun &rest args)
  "Advice for projectile to update frame's working directory value when switching project. See user-packages/current-working-directory.el."
  (let (
    (project-to-switch (car args))
  )
    (cwd-set-frame-working-directory (selected-frame) project-to-switch)
  )
  (apply orig-fun args)
)
(advice-add 'projectile-switch-project-by-name :around #'my-projectile-switch-project-by-name)
