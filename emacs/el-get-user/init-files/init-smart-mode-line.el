;; Disable theme safety check
(setq custom-safe-themes t)

;; Initialize smart mode line
(sml/setup)

;; Add to front of replacer to remove path prefix from mode line
(add-to-list 'sml/replacer-regexp-list '(".*" " "))

(setq sml/name-width '(5 . 96))
(setq sml/mode-width 'right)
