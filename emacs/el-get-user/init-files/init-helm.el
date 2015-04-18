;; Enable helm
(helm-mode 1)

;; Setup helm key bindings/overrides
(bind-key* "M-x" 'helm-M-x)
(bind-key* "C-x f" 'helm-find-files)
(bind-key* "C-x C-f" 'helm-find-files)
(bind-key* "C-x C-b" 'helm-mini)

(bind-key* "C-c b l" 'helm-mini)
(bind-key* "C-c s o" 'helm-occur)
(bind-key* "C-c r e" 'helm-resume)

;; Create helm split inside the current window instead of seemingly randomly
;; taking over a different window
;(setq helm-split-window-in-side-p t)

;; Instead of creating a split for helm buffer, just temporarily take over the
;; current window instead
(setq helm-split-window-default-side 'same)

;; Override helm fuzzy matching function to disable the feature
(defun helm-fuzzy-match (candidate))
(defun helm-fuzzy-search (pattern))
