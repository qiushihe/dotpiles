(add-hook 'after-init-hook 'global-company-mode)

;; Workaround a fill-column-indicator/company-mode bug
(defvar-local company-fci-mode-on-p nil)
(defun company-turn-off-fci (&rest ignore) (when (boundp 'fci-mode) (setq company-fci-mode-on-p fci-mode) (when fci-mode (fci-mode -1))))
(defun company-maybe-turn-on-fci (&rest ignore) (when company-fci-mode-on-p (fci-mode 1)))
(add-hook 'company-completion-started-hook 'company-turn-off-fci)
(add-hook 'company-completion-finished-hook 'company-maybe-turn-on-fci)
(add-hook 'company-completion-cancelled-hook 'company-maybe-turn-on-fci)
