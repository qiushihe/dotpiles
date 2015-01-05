(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'helm-mini)

(global-set-key (kbd "C-x f") 'helm-find-files)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(global-set-key (kbd "C-c s o") 'helm-occur)

;; Override helm fuzzy matching function to disable the feature
(defun helm-fuzzy-match (candidate))
(defun helm-fuzzy-search (pattern))
