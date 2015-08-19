(setq fci-rule-column 100)
(setq fci-rule-color "#014554")

(add-hook 'after-change-major-mode-hook (lambda ()
  (turn-on-fci-mode)
))
