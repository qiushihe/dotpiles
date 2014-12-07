;; Thin cursor
(defun cursor-shape-hook ()
  (setq cursor-type '(bar . 1)))
(add-hook 'post-command-hook 'cursor-shape-hook)
