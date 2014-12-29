;; Unbind some OSX-specific bindings
(global-unset-key (kbd "s-s"))
(global-unset-key (kbd "s-a"))
(global-unset-key (kbd "s-z"))
(global-unset-key (kbd "s-Z"))
(global-unset-key (kbd "s-c"))
(global-unset-key (kbd "s-x"))
(global-unset-key (kbd "s-v"))

;; Rebind kill-this-buffer
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)

;; Resize window
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Keyboard scrolling speed
(setq scroll-step 10)
(setq hscroll-step 10)

;; Mouse scrolling settings
(setq mouse-autoselect-window t)
(setq mouse-wheel-follow-mouse 't)
