(defun my-switch-to-previous-buffer ()
  "Switch to previously open buffer.
  Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(global-set-key (kbd "C-x b") 'my-switch-to-previous-buffer)
(global-set-key (kbd "C-c b b") 'my-switch-to-previous-buffer)
