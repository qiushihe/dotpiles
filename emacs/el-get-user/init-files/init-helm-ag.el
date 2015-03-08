(global-set-key (kbd "C-c s p") 'helm-ag)

;; Remove a conflicting key binding in handlebars mode
(add-hook `handlebars-mode-hook (lambda ()
  (local-unset-key (kbd "C-c s"))
))
