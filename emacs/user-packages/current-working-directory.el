(make-variable-frame-local 'cwd-frame-working-dir)

(add-hook 'after-make-frame-functions (lambda (frame)
  "Copy working directory value from the previous frame to the newly created frame"
  (cwd-set-frame-working-directory frame (cwd-get-frame-working-directory (previous-frame)))
))

(defun cwd-set-frame-working-directory (frame directory)
  "Set the working directory value for the given frame"
  (modify-frame-parameters frame (list (cons 'cwd-frame-working-dir directory)))
)

(defun cwd-get-frame-working-directory (frame)
  "Get the working directory value for the given frame"
  (frame-parameter frame 'cwd-frame-working-dir)
)

(provide 'current-working-directory)
