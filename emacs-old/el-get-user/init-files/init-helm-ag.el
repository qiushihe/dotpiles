(bind-key* "C-c s p" 'helm-projectile-ag)

;; Replace ag with pt
(setq helm-ag-base-command "pt --nocolor --nogroup")
