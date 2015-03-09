(global-set-key (kbd "C-c s p") 'helm-projectile-ag)

;; Replace ag with pt
(setq helm-ag-base-command "pt --nocolor --nogroup")

;; Remove a conflicting key binding in handlebars mode
(add-hook `handlebars-mode-hook (lambda ()
  (local-unset-key (kbd "C-c s"))
))
