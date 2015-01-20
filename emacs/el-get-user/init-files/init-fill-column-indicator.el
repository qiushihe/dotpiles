;; Set column indicator width to 100
(setq fci-rule-column 100)

;; Enable in all buffers
(add-hook 'after-change-major-mode-hook 'fci-mode)

;; Remove the line overflow arrow
(setq-default fringe-indicator-alist (assq-delete-all 'truncation fringe-indicator-alist))
