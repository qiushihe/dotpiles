(use-package company
  :pin melpa
  :config (progn
    (define-key company-active-map (kbd "<return>") nil)
    (define-key company-active-map (kbd "RET") nil)
    (define-key company-active-map (kbd "<tab>") #'company-complete-selection)
    (add-hook 'after-init-hook 'global-company-mode)
  )
)
