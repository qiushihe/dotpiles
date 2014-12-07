;; Make tab behave "normally"
(defun my-tab ()
  (interactive)
  (insert "  "))
(global-set-key "\t" 'my-tab)
(add-hook 'after-change-major-mode-hook (lambda () (local-set-key "\t" 'my-tab)))

;; Make auto-indent behave "normally"
(defun my-enter ()
  (interactive)
  (newline)
  (indent-relative-maybe))
(global-set-key (kbd "RET") 'my-enter)
(add-hook 'after-change-major-mode-hook (lambda () (local-set-key (kbd "RET") 'my-enter)))
