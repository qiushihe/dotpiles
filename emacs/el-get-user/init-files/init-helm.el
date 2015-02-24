;; Enable helm
(helm-mode 1)

;; Setup helm key bindings/overrides
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'helm-mini)
(global-set-key (kbd "C-x f") 'helm-find-files)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c s o") 'helm-occur)

;; Create helm split inside the current window instead of seemingly randomly
;; taking over a different window
(setq helm-split-window-in-side-p t)

;; Override helm fuzzy matching function to disable the feature
(defun helm-fuzzy-match (candidate))
(defun helm-fuzzy-search (pattern))
