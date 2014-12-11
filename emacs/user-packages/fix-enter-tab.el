;; Make tab behave "normally"
(defun my-tab-with-space ()
  (interactive)
  (insert "  ")
)

(defun my-tab-with-tab ()
  (interactive)
  (insert "\t")
)

(global-set-key "\t" 'my-tab-with-space)
(add-hook 'text-mode-hook (lambda ()
  (local-set-key "\t" 'my-tab-with-space)
))

;; But for makefile-mode use \t instead of space
(add-hook 'makefile-mode-hook (lambda ()
  (local-set-key "\t" 'my-tab-with-tab)
))

;; Make auto-indent behave "normally"
(defun my-enter ()
  (interactive)
  (newline)
  (indent-relative-maybe)
)

(global-set-key (kbd "RET") 'my-enter)
(add-hook 'text-mode-hook (lambda ()
  (local-set-key (kbd "RET") 'my-enter)
))
