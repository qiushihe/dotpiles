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
                (powerline-raw "%p " nil 'l)
                (powerline-raw "%l" nil 'l)
                (powerline-raw ":" nil 'l)
                (powerline-raw "%c" nil 'l)
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
                (powerline-raw "%*" nil 'l)
                (powerline-raw mode-line-mule-info nil 'l)
                (powerline-raw "  ")
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

(setq powerline-default-separator 'arrow)

;; Create hash tables to hold the *incorrectly* displayed colours
(setq my-pl-incorrect-colour-tables (make-hash-table :test 'equal))

;; Set this variable to control which colour table to calculation
;; colour corrections from
(setq my-pl-use-incorrect-colour-table nil)

(defun my-pl-set-incorrect-colour-table (name colours)
  (let (
    (table (make-hash-table :test 'equal))
  )
    (mapc (lambda (colour)
      (puthash (nth 0 (nth 1 colour)) (nth 1 (nth 1 colour)) table)
    ) colours)
    (puthash name table my-pl-incorrect-colour-tables)
  )
)

(defun my/colour-diff (colour1 colour2)
  (let (
    (rgb1 (color-name-to-rgb colour1))
    (rgb2 (color-name-to-rgb colour2))
  )
    (color-rgb-to-hex
      (- (nth 0 rgb1) (nth 0 rgb2))
      (- (nth 1 rgb1) (nth 1 rgb2))
      (- (nth 2 rgb1) (nth 2 rgb2))
    )
  )
)

(defun my/correct-srgb (display-wrong spec-correct)
  (my/colour-diff spec-correct (my/colour-diff display-wrong spec-correct))
)

(defun my-pl-background-color (orig-fun &rest args)
  (let* (
    (name (nth 0 args))
    (res (apply orig-fun args))
    (colour-table (and
      my-pl-use-incorrect-colour-table
      (gethash my-pl-use-incorrect-colour-table my-pl-incorrect-colour-tables)
    ))
    (table-colour (and colour-table (gethash (prin1-to-string name) colour-table)))
  )
    (or (and table-colour (my/correct-srgb table-colour res)) res)
  )
)
(advice-add 'pl/background-color :around #'my-pl-background-color)

(my-pl-set-incorrect-colour-table "solarized-dark" '(
  '("mode-line" "#A4B0B0")
  '("powerline-active1" "#788E95")
  '("powerline-active2" "#96A5A6")
  '("mode-line-inactive" "#788E95")
  '("powerline-inactive1" "#014554")
  '("powerline-inactive2" "#6A8188")
))

(my-pl-set-incorrect-colour-table "solarized-light" '(
  '("mode-line" "#6A8188")
  '("powerline-active1" "#96A5A6")
  '("powerline-active2" "#788E95")
  '("mode-line-inactive" "#96A5A6")
  '("powerline-inactive1" "#F2ECDD")
  '("powerline-inactive2" "#A4B0B1")
))

(setq my-pl-use-incorrect-colour-table "solarized-dark")

(my-powerline-default-theme)
