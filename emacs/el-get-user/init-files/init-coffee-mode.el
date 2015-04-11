;; Disable coffee mode's backspace outdent mapping
(add-hook 'coffee-mode-hook (lambda ()
  (define-key coffee-mode-map "\177" nil)
))
