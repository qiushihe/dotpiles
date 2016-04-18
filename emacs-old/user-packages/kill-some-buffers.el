;; http://superuser.com/a/896020
(defun my-kill-some-buffers (&optional arg)
  "When called with a prefix argument -- i.e., C-u -- kill all interesting buffers -- i.e., all
  buffers without a leading space in the buffer-name. When called without a prefix argument, kill
  just the current buffer -- i.e., interesting or uninteresting."
  (interactive "P")
  (cond
    ((and (consp arg) (equal arg '(4)))
      (mapc
        (lambda (x)
          (let ((name (buffer-name x)))
            (unless (eq ?\s (aref name 0))
              (kill-buffer x))))
        (buffer-list)))
    (t
      (kill-buffer (current-buffer)))))

(bind-key* "C-c b d" 'my-kill-some-buffers)
