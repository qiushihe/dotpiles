;; Line number
(global-linum-mode 1)
(unless (display-graphic-p) ; Only add space between line number and text in non-GUI mode
  (setq linum-format (lambda (line)
    (propertize
      (format
        (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
          (concat "%" (number-to-string w) "d "))
        line) 'face 'linum))))
