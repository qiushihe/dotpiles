;; Line number
(global-linum-mode 1)

(custom-set-variables '(linum-format 'dynamic))
(defadvice linum-update-window (around linum-dynamic activate)
  (if (display-graphic-p)
    ;; For GUI mode there is already a space after the line number by default
    (let* (
      (w (length (number-to-string (count-lines (point-min) (point-max)))))
      (linum-format (concat " %" (number-to-string w) "d"))
    ) ad-do-it)
    ;; For non-GUI mode add a space after the line number
    (let* (
      (w (length (number-to-string (count-lines (point-min) (point-max)))))
      (linum-format (concat " %" (number-to-string w) "d "))
    ) ad-do-it)
  )
)
