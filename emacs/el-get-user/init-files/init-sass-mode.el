;; Disable sass mode's backspace outdent mapping (interestingly it's caused
;; by the haml-mode dependency of sass-mode)
(add-hook 'sass-mode-hook (lambda ()
  (define-key haml-mode-map "\177" nil)
))
