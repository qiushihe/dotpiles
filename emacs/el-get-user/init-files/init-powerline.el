;; My customized mode-line format
(defun my-powerline-default-theme ()
  (interactive)
  (setq-default mode-line-format
    '("%e"
      (:eval
        (let*
          (
            (active (powerline-selected-window-active))
            (mode-line (if active 'mode-line 'mode-line-inactive))
            (face1 (if active 'powerline-active1 'powerline-inactive1))
            (face2 (if active 'powerline-active2 'powerline-inactive2))
            (separator-left (intern (format "powerline-%s-%s" powerline-default-separator (car powerline-default-separator-dir))))
            (separator-right (intern (format "powerline-%s-%s" powerline-default-separator (cdr powerline-default-separator-dir))))

            (lhs
              (list
                (powerline-raw "%*" nil 'l)
                (powerline-raw mode-line-mule-info nil 'l)
                (powerline-raw "%p" nil 'l)
                (powerline-buffer-id nil 'l)
                (when (and (boundp 'which-func-mode) which-func-mode) (powerline-raw which-func-format nil 'l))
                (powerline-raw " ")
                (funcall separator-left mode-line face1)
                (when (boundp 'erc-modified-channels-object) (powerline-raw erc-modified-channels-object face1 'l))
                (powerline-major-mode face1 'l)
                (powerline-process face1)
                (powerline-raw " " face1)
                (funcall separator-left face1 face2)
                (powerline-vc face2 'r)
              )
            )

            (rhs
              (list
                (powerline-raw global-mode-string face2 'r)
                (funcall separator-right face2 face1)
                (powerline-minor-modes face1 'l)
                (powerline-narrow face1 'l)
                (powerline-raw " " face1)
                (funcall separator-right face1 mode-line)
                (powerline-raw "%l" nil 'l)
                (powerline-raw ": " nil 'l)
                (powerline-raw "%c" nil 'r)
                (powerline-raw " ")
                (powerline-hud face2 face1)
              )
            )
          )

          (concat
            (powerline-render lhs)
            (powerline-fill face2 (powerline-width rhs))
            (powerline-render rhs)
          )
        )
      )
    )
  )
)

;; (defun my-pl-background-color (orig-fun &rest args)
;;   (message "pl/background-color called with args %S" args)
;;   (let
;;     (
;;       (res (apply orig-fun args))
;;     )
;;     (message "pl/background-color returned %S" res)
;;     res
;;   )
;; )
;; (advice-add 'pl/background-color :around #'my-pl-background-color)

;; (setq powerline-default-separator 'box)
;; (setq powerline-default-separator 'brace)

(my-powerline-default-theme)
