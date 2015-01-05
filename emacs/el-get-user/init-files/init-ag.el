(setq ag-reuse-buffers t)
(setq ag-reuse-window t)

(global-set-key (kbd "C-c s p") 'ag-project)

;; Remove a conflicting key binding in handlebars mode
(add-hook `handlebars-mode-hook (lambda ()
  (local-unset-key (kbd "C-c s"))
))
