;; Line number
(global-linum-mode 1)

(if (display-graphic-p)
  ;; For GUI, only add a " " before the number since there is by default a " " after
  ;; the number already
  (progn
    (setq linum-format (lambda (line)
      (propertize
        (format
          (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
            (concat " %" (number-to-string w) "d"))
          line) 'face 'linum)))
  )
  ;; For non-GUI, add a " " before and after the number
  (progn
    (setq linum-format (lambda (line)
      (propertize
        (format
          (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
            (concat " %" (number-to-string w) "d "))
          line) 'face 'linum)))
  )
)
