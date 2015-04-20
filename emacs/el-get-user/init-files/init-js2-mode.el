(unless (boundp 'js2-global-externs) (setq js2-global-externs []))
(add-to-list 'js2-global-externs "define")
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-mode))
