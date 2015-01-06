(defun my-goto-matching-parenthesis ()
  "Jump to the matching parenthesis if on parenthesis"
  (interactive)
  (cond
    ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
    ((looking-at "\\s\)") (forward-char 1) (backward-list 1))))

(global-set-key (kbd "C-c [") 'my-goto-matching-parenthesis)
